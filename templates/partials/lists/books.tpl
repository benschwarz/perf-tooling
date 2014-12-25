<ui class="posts">
  <%
    var orderedList = _.sortBy( list, function( article ) {
      return article.date || -1;
    } ).reverse();
  %>
  <% _.each( orderedList , function( book ) { %>

    <li id="<%= book.name.toLowerCase().replace( /[\s\.,:'"#\(\)|]/g, '-' ) %>" class="post-book <%= ( book.hidden === true ) ? 'is-hidden' : '' %>">

      <% var twitterHandle = ( book.social && book.social.twitter ) ? book.social.twitter.replace( '@', '' ) : false; %>

      <% if ( twitterHandle && people[ twitterHandle ] ) { %>

        <a href="https://twitter.com/<%= twitterHandle %>" title="Twitter profile of <%= book.author %>" target="_blank"><img src="<%= people[ twitterHandle ].image %>" title="Image of <%= book.author %>" class="post-author-img"></a>

      <% } %>

      <div class="post-content">

        <h3 class="post-title"><a href="<%= book.url %>" alt="Link to <%= book.name %>" title="Link to book" target="_blank"><%= book.name %></a></h3>

        <% if ( twitterHandle && people[ twitterHandle ] ) { %>

          <h4><%= book.date %> by <a href="https://twitter.com/<%= twitterHandle %>" title="Twitter profile of <%= book.author %>" target="_blank"><%= book.author %></a> (<%= people[ twitterHandle ].followerCount %> followers)</h4>

        <% } else { %>

          <h4><%= book.date %> by <%= book.author %></h4>

        <% } %>

        <% if ( book.tags && book.tags.length ) { %>

          <%=
            partial(
              'templates/partials/tags.tpl',
              {
                tags : book.tags
              }
            )
          %>

        <% }%>

      </div>

    </li>

   <% } );%>

</ui>
