<?php
namespace Backoffice\Game\Controllers;

use System\Datalayer\DLGame;
use System\Datalayer\DLGameWhitelistIp;
use System\Library\General\GlobalVariable;

class WhitelistController extends \Backoffice\Controllers\ProtectedController
{
    public function indexAction()
    {
        $view = $this->view;

        if ($this->request->getPost()) {
            $data = $this->request->getPost();

            $action = $this->request->get('action');

            var_dump(3);die;
        }
    }

    public function addAction()
    {
        $previousPage = new GlobalVariable();

        if ($this->request->getPost()) {
            try {
                $this->db->begin();

                $data = $this->request->getPost();

                $tab = $data['tab'];
                if($this->_allowed == 0){
                    return $this->response->redirect($previousPage->previousPage()."#".$tab)->send();
                }

                $DLGameWhitelistIp = new DLGameWhitelistIp();

                $filterData = $DLGameWhitelistIp->filterInput($data);
                $DLGameWhitelistIp->validateAdd($filterData);
                $DLGameWhitelistIp->create($filterData);

                $this->db->commit();
                $this->flash->success('game_whitelist_ip_created');
            } catch (\Exception $e) {
                $this->db->rollback();
                $this->flash->error($e->getMessage());
            }
            $this->response->redirect($previousPage->previousPage()."#".$tab)->send();
        }
    }

    public function editAction()
    {
        $previousPage = new GlobalVariable();

        if ($this->request->getPost()) {
            $data = $this->request->getPost();
            $tab = $data['tab'];

            try {
                $this->db->begin();

                $DLProviderGameEndpoint = new DLGameWhitelistIp();

                $filterData = $DLProviderGameEndpoint->filterInput($data);
                $DLProviderGameEndpoint->validateEdit($filterData);
                $DLProviderGameEndpoint->set($data);

                $this->db->commit();
                $this->flash->success('game_whitelist_ip_edited');
            } catch (\Exception $e) {
                $this->db->rollback();
                $this->flash->error($e->getMessage());
            }
            $this->response->redirect($previousPage->previousPage() . "#" . $tab)->send();
        }
    }

    public function deleteAction()
    {
        $previousPage = new GlobalVariable();
        $data["agent_id"] = $this->dispatcher->getParam("id");
        $data["whitelist_id"] = $this->request->get("delete");

        $DLGameWhitelistIp = new DLGameWhitelistIp();

        // TODO :: Temporary Code
        if($this->_user->getType() != 9){
            $this->flash->error("cannot_access");
            return $this->response->redirect($previousPage->previousPage() . "#tab-ip")->send();
        }

        try {
            $this->db->begin();

            $DLGameWhitelistIp->delete($data["whitelist_id"]);

            $this->db->commit();
            $this->flash->success("ip_deleted");
            $this->response->redirect($previousPage->previousPage() . "#tab-ip")->send();
        } catch (\Exception $e) {
            $this->db->rollback();
            $this->flash->error($e->getMessage());
        }
    }
}
