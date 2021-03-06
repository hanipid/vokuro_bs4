{{ content() }}

<div class="float-left">
    {{ link_to("profiles/index", "&larr; Go Back") }}
</div>
<div class="float-right">
    {{ link_to("profiles/create", "Create profiles", "class": "btn btn-primary") }}
</div>

{% for profile in page.items %}
{% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Active?</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
{% endif %}
        <tr>
            <td>{{ profile.id }}</td>
            <td>{{ profile.name }}</td>
            <td>{{ profile.active == 'Y' ? 'Yes' : 'No' }}</td>
            <td width="12%">{{ link_to("profiles/edit/" ~ profile.id, '<i class="icon-pencil"></i> Edit', "class": "btn") }}</td>
            <td width="12%">{{ link_to("profiles/delete/" ~ profile.id, '<i class="icon-remove"></i> Delete', "class": "btn", "onclick":"return confirm('Are you sure?')") }}</td>
        </tr>
{% if loop.last %}
    </tbody>
    <tfoot>
        <tr>
            <td colspan="10" align="right">
                <div class="btn-group">
                    {{ link_to("profiles/search", '<i class="icon-fast-backward"></i> First', "class": "btn btn-secondary") }}
                    {{ link_to("profiles/search?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn btn-secondary") }}
                    {{ link_to("profiles/search?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn btn-secondary") }}
                    {{ link_to("profiles/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn btn-secondary") }}
                    <span class="btn">{{ page.current }}/{{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tfoot>
</table>
{% endif %}
{% else %}
    No profiles are recorded
{% endfor %}
