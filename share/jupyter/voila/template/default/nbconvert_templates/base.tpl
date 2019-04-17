{%- extends 'basic.tpl' -%}
{% from 'mathjax.tpl' import mathjax %}

{%- block header -%}
<!DOCTYPE html>
<html>
<head>
{%- block html_head -%}
<meta charset="utf-8" />
{% set nb_title = nb.metadata.get('title', '') or resources['metadata']['name'] %}
<title>Pulsifi Demo</title>

<link rel="stylesheet" href="https://unpkg.com/font-awesome@4.5.0/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.css" type="text/css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis-network.min.js"> </script>
{%- block html_head_js -%}

<script src="{{resources.base_url}}voila/static/jquery.min.js"></script>

<script id="jupyter-config-data" type="application/json">
{
    "baseUrl": "{{resources.base_url}}",
    "kernelId": "{{resources.kernel_id}}"
}
</script>
{%- endblock html_head_js -%}


{%- block html_head_css -%}
{%- endblock html_head_css -%}
{%- endblock html_head -%}
</head>
{%- endblock header -%}
<h1> Pulsifi Demo </h1>

{% block footer %}
{% block footer_js %}
<script
    src="{{resources.base_url}}voila/static/require.min.js"
    integrity="sha256-Ae2Vz/4ePdIu6ZyI/5ZGsYnb+m0JlOmKPjt6XZ9JJkA="
    crossorigin="anonymous">
</script>
<script>
requirejs.config({ baseUrl: '{{resources.base_url}}voila/', waitSeconds: 30})
requirejs(
    [
        "static/main",
    {% for ext in resources.nbextensions -%}
        "{{resources.base_url}}voila/nbextensions/{{ ext }}.js",
    {% endfor %}
    ]
)
</script>

{% endblock footer_js %}
{{ super() }}
</html>
{% endblock footer %}
