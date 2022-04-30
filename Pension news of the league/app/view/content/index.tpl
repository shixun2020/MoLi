{% extends 'base.tpl' %}

{% block main %}
    <table border="1" cellpadding="30" width="100%">
        <tr>
            <th>ID</th>
            <td>{{contented.id }}</td>
        </tr>
        <tr>
            <th>板块</th>
            <td>{{ contented.plate }}</td>
        </tr>
        <tr>
            <th>内容</th>
            <td>{{contented.content }}</td>
        </tr>
        <tr>
            <th>时间</th>
            <td>{{contented.create_time.toLocaleString('UTC',  {year: 'numeric', month: 'numeric', day: 'numeric',
                                                                hour: 'numeric', minute: 'numeric', second: 'numeric',
                                                              hour12: false}) }}
            </td>
        </tr>
    </table>
{% endblock %}