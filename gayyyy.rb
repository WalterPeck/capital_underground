<% if current_page?('/')%>
           	<a class="navbar-brand" style="color:#999"href="/">Welcome</a>
           <%else%>	
           	<a class="navbar-brand" href="/"><p>Capital Underground</p></a>
           <%end%>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
             <!-- <li class="active"><a href="#">Link</a></li> -->
              <li><%= link_to "Home",    root_path %></li>
              <li><%= link_to "Help",  help_path %></li>
              <% if signed_in? %>
          			<li><%= link_to "Profile", current_user %></li>
              <% end %>
              
              <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
            
           
          		
          		<ul class="nav navbar-nav navbar-right">
    					  
    					  <% if signed_in? %>
    						<% if current_user.switch == 'albany'%>
          				 <li><%= link_to "Troy", troy_users_path(current_user) %></li>
           			<% elsif current_user.switch == 'profile'%>	
          				<li><%= link_to "Troy", troy_users_path(current_user) %></li>
           				<li><%= link_to "Albany", albany_users_path(current_user) %></li>
           			<% elsif current_user.switch == 'troy'%>	
          				<li><%= link_to "Albany", albany_users_path(current_user) %></li>
            		<%end%>
						 
						  	<li><%= link_to "Sign out", signout_path, method: "delete" %>
              </ul>
						<% else %>
							<li><%= link_to "Sign in", '/signin' %></li>
							
						<% end %>
          
          </div><!--/.nav-collapse -->
        </div>
      </div>