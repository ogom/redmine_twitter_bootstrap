Redmine Twitter Bootstrap
=========================

Will use the Twitter Bootstrap on the Redmine.

## Features

* Include the javascript and stylesheet of Twitter Bootstrap.
* View helper of Twitter Bootstrap.

## Installation

```
$ git clone https://github.com/ogom/redmine_twitter_bootstrap ./plugins/redmine_twitter_bootstrap
```

## Usage

### Helper

Add to helper.

```
include RedmineTwitterBootstrap::Helper
```

### Layout 

example of `app/views/layouts/base.html.erb`.

```
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title><%=h html_title %></title>
<meta name="description" content="<%= Redmine::Info.app_name %>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%= csrf_meta_tag %>
<%= favicon %>

<style>
  body {padding-top: 60px;}
</style>
    
<%= stylesheet_link_tag "bootstrap.min.css", plugin: :redmine_twitter_bootstrap %>
<%= stylesheet_link_tag "bootstrap-responsive.min.css", plugin: :redmine_twitter_bootstrap %>

<%= javascript_heads %>
<%= javascript_include_tag "bootstrap.min.js", plugin: :redmine_twitter_bootstrap %>
</head>

<body data-spy="scroll">

<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="brand" href="/"><%= page_header_title %></a>
      <div class="nav-collapse collapse">
        <p class="navbar-text pull-right">
          Logged in as <%= "#{link_to_user(User.current, format: :username)}".html_safe if User.current.logged? %>
        </p>
        <ul class="nav">
          <%= nav_list_tag("Users", {controller: "users", action: "index"}) %>
          <%= nav_list_tag("Groups", {controller: "groups", action: "index"}) %>
        </ul>
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="content-fluid">  

<%= yield %>

  </div>
</div>

</body>
</html>
```

## License 

* MIT
