{% block content %}
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-xs-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title row">
                            <h5>[{{currency.name}}] {{translate['title_text_detail']}}</h5>
                        </div>
                        <div class="ibox-content row">
                            <form class="form-horizontal col-xs-12" action="#" method="post">
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">{{translate['form_currency_code']}}</label>
                                    <label class="col-xs-9">
                                        <input type="text" class="form-control" value="{{currency.code}}" readonly placeholder="{{translate['placeholder_currency_code']}}">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">{{translate['form_currency_name']}}</label>
                                    <label class="col-xs-9">
                                        <input type="text" name="name" class="form-control" value="{{currency.name}}" readonly placeholder="{{translate['placeholder_currency_name']}}">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">{{translate['form_currency_symbol']}}</label>
                                    <label class="col-xs-9">
                                        <input type="text" name="symbol" class="form-control" value="{{currency.symbol}}"readonly placeholder="{{translate['placeholder_currency_symbol']}}">
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3 control-label">{{translate['form_status']}}</label>
                                    <div class="col-xs-9">
                                        <div class="input-group">
                                            {% if currency.status == 1 %}
                                                {% set status = 'active' %}
                                                {% set updateStatus = 0 %}
                                            {% else %}
                                                {% set status = 'inactive' %}
                                                {% set updateStatus = 1 %}
                                            {% endif %}
                                            <input type="text" class="form-control" readonly value="{{translate[status]}}">
                                            <div class="input-group-btn">
                                                <button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu pull-right">
                                                    <li>
                                                        <a href="{{'/'~module~'/'~controller~'/status/'~currency.code|lowercase~'|'~updateStatus}}">
                                                        {% if currency.status == 1 %}
                                                            {{translate['inactive']}}
                                                        {% else %}
                                                            {{translate['active']}}
                                                        {% endif %}
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group"><div class="hr-line-dashed"></div></div>
                                <div class="form-group pull-right">
                                    <div class="col-xs-12">
                                        <label>
                                            <a href="{{'/'~module~'/'~controller}}" class="btn btn-sm btn-danger">{{translate['button_back']}}</a>
                                        </label>
                                        <label>
                                            <a href="{{'/'~module~'/'~controller~'/edit/'~currency.code|lowercase}}" class="btn btn-sm btn-info">{{translate['button_edit']}}</a>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
{% endblock %}

{% block action_js %}

{% endblock %}