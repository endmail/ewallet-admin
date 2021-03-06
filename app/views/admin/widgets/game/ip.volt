<div class="panel-body">
    <form class="form-horizontal col-xs-12">
        <div class="list-inline text-right">
            <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#form-ip">
                Add New
            </button>
        </div>
        <ul class="list-inline header-list text-center">
          <li class="col-xs-2 list-group-item">No</li>
          <li class="col-xs-8 list-group-item">IP</li>
          <li class="col-xs-2 list-group-item">&nbsp;</li>
        </ul>
        <div style="height:200px; overflow:auto;">
        {% if page is not null %}
            {% set i = 1 %}
            {% for gameWhitelistIpData in page %}
                {% if i%2 == 0 %}
                {% set class = "content-even" %}
                {% else %}
                {% set class = "content-odd" %}
                {% endif %}
                <ul class="list-inline {{class}} text-center">
                    <li class="col-sm-2 col-xs-2 list-group-item">{{i}}</li>
                    <li class="col-sm-8 col-xs-8 list-group-item"><span id="id_{{gameWhitelistIpData.id}}">{{gameWhitelistIpData.ip}}</span></li>
                    <li class="col-sm-2 col-xs-2 list-group-item">
                        <a href="{{url(module~'/whitelist/delete/'~game.id~'?delete='~gameWhitelistIpData.id)}}" class="delete"><span class="ip-edit fa fa-ban text-danger" title="delete"></span></a>
                    </li>
                </ul>
                {% set i = i +1 %}
            {% endfor %}
        {% else %}
            <h4 class="text-center">-No data-</h4>
        {% endif %}
        </div>
    </form>
</div>

{{ widget('GameWhitelistIpFormAddWidget', []) }}
{{ widget('GameWhitelistIpFormEditWidget', ["id": game.id]) }}

<script>
    $(document).ready(function(){
        $(".delete").click(function(){
            var conf = confirm('Are You Sure?');
            if(!conf){
                return false;
            }
        });
    });
</script>