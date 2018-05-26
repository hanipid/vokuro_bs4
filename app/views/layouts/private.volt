<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
  {{ link_to(null, 'class': 'navbar-brand', 'Vökuró')}}
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation" style="">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav navbar-sidenav">
      {%- set menus = [
        'Home': null,
        'Users': 'users',
        'Profiles': 'profiles',
        'Permissions': 'permissions'
      ] -%}

      {%- for key, value in menus %}
        {% if value == dispatcher.getControllerName() %}
        <li class="nav-item active">
          <a href="{{ url(value) }}" class="nav-link">
            {#{ link_to(value, key, 'class':'nav-link') }#}
            <i class="fa fa-fw fa-angle-right"></i>
            <span class="nav-link-text">{{ key }}</span>
          </a>
        </li>
        {% else %}
        <li class="nav-item">
          <a href="{{ url(value) }}" class="nav-link">
            {#{ link_to(value, key, 'class':'nav-link') }#}
            <i class="fa fa-fw fa-angle-right"></i>
            <span class="nav-link-text">{{ key }}</span>
          </a>
        </li>
        {% endif %}
      {%- endfor -%}
    </ul>

    <!-- <ul class="navbar-nav sidenav-toggler">
      <li class="nav-item">
        <a class="nav-link text-center" id="sidenavToggler">
          <i class="fa fa-fw fa-angle-left"></i>
        </a>
      </li>
    </ul> -->

    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">{{ auth.getName() }} <b class="caret"></b></a>
        <ul class="dropdown-menu dropdown-menu-right">
          <li>{{ link_to('users/changePassword', 'Change Password', 'class':'dropdown-item') }}</li>
        </ul>
      </li>
      <li>{{ link_to('session/logout', 'Logout', 'class':'nav-link') }}</li>
    </ul>
  </div>
</nav>

<div class="content-wrapper">
  <div class="container main-container">
    {{ content() }}
  </div>
</div>