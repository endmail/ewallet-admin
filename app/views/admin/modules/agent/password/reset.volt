{% block content %}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-xs-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title row">
                    <h5>[{{agent.username}}] {{translate['title_text_reset_password']}}</h5>
                </div>
                <div class="ibox-content row">
                    <div class="panel-body">
                        <form class="form-horizontal col-xs-12" action="{{router.getRewriteUri()}}" method="post">
                            <div class="form-group">
                                <label class="col-xs-3 control-label">{{translate['form_password']}}</label>
                                <label class="col-xs-9">
                                    <input type="password" placeholder="{{translate['placeholder_password']}}" class="form-control" name="password">
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">{{translate['form_confirm_password']}}</label>
                                <label class="col-xs-9">
                                    <input type="password" placeholder="{{translate['placeholder_confirm_password']}}" class="form-control" name="confirm_password">
                                </label>
                            </div>
                            <div class="form-group"><div class="hr-line-dashed"></div></div>
                            <div class="form-group pull-right">
                                <div class="col-xs-12">
                                  <label>
                                      <a href="{{url('javascript:history.go(-1)')}}" class="btn btn-sm btn-danger">{{translate['button_back']}}</a>
                                  </label>
                                  <label>
                                      <input type="submit" name="submit" class="btn btn-sm btn-primary" value="{{translate['button_edit']}}">
                                  </label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{% endblock %}

{% block action_js %}
    <script>
        var url = window.location.href;
        var activeTab = url.substring(url.indexOf("#") + 1);

        if(url.includes("#") == true){
            $(".tab").removeClass("active");
            $("#head-" + activeTab).addClass("active");

            $(".tab-pane").removeClass("active");
            $("#" + activeTab).addClass("active");
        }else{
            $("#head-tab-general").addClass("active");
            $("#tab-general").addClass("active");
            // temporary
            {% set userCurrencyData = 1 %}
            {% set providerEndPointData = 1 %}
            {% if userCurrencyData != 0 and providerEndPointData != 0 %}
                $("#head-tab-currency").removeClass("active");
                $("#tab-currency").removeClass("active");

                $("#head-tab-game").removeClass("active");
                $("#tab-game").removeClass("active");
            {% else %}
                $("#head-tab-general").removeClass("active");
                $("#tab-general").removeClass("active");

                {% if gameCurrencyData == 0 %}
                    $("#head-tab-currency").addClass("active");
                    $("#tab-currency").addClass("active");
                {% elseif providerEndPointData == 0 %}
                    $("#head-tab-game").addClass("active");
                    $("#tab-game").addClass("active");
                {% endif %}
            {% endif %}
        }
    </script>
{% endblock %}