<ul class="posts">
  <% list = _.sortBy( list, function( video ) { return video.publishedAt; } ).reverse();%>

  <% _.each( list , function( video ) { %>
    <% var title = _.escape( video.title || video.name ); %>

    <li id="<%= video.name.toLowerCase().replace( /[\s\.,:'"#\(\)|]/g, '-' ) %>" class="post post--video media <%= ( video.hidden === true ) ? 'is-hidden' : '' %>">

      <% var twitterHandle = ( video.social && video.social.twitter ) ? video.social.twitter.replace( '@', '' ) : false; %>

      <% if ( video.thumbnail ) { %>

        <figure class="media__obj--left">

          <a href="<%= video.url %>" title="Link to video" target="_blank" data-modal data-modal-content-id="<%= video.name.toLowerCase().replace( /[\s\.,:'"#\(\)|]/g, '-' ) %>">
            <img src="<%= video.thumbnail.url %>" width="295" height="166" alt="Preview of <%= video.name %>">
          </a>

        </figure>

      <% } %>

      <div class="media__body">

        <h3><a href="<%= video.url %>" class="link--text" title="Link to video" target="_blank" data-modal data-modal-content-id="<%= video.name.toLowerCase().replace( /[\s\.,:'"#\(\)|]/g, '-' ) %>"><%= video.title || video.name %></a></h3>

        <% if ( twitterHandle && people[ twitterHandle ] ) { %>

          <h4><%= video.date %> by <a href="https://twitter.com/<%= twitterHandle %>" title="Twitter profile of <%= video.author %>" target="_blank"><%= video.author %></a> (<%= people[ twitterHandle ].followerCount %> followers)</h4>

         <% } else { %>

          <%=
            partial(
              'templates/partials/authors/names.tpl',
              {
                entry   : video,
                authors : video.authors,
                people  : people
              }
            )
          %>

        <% } %>

        <p><a href="<%= video.url %>" target="_blank">Open in new tab</a></p>

        <% if ( video.stats ) { %>

          <ul class="post__stats">
            <% if ( video.stats.viewCount ) { %>

              <li>
                <span class="visuallyhidden">Views:</span>
                 <svg class="icon icon--grey">
                  <use xlink:href="/icons-<%= hash.svg %>.svg#view" />
                </svg><%= video.stats.viewCount %>
              </li>

            <% } %>

            <% if ( video.stats.likeCount ) { %>

              <li>
                <span class="visuallyhidden">Likes:</span>
                <svg class="icon icon--grey">
                  <use xlink:href="/icons-<%= hash.svg %>.svg#like" />
                </svg>
                <%= video.stats.likeCount %>
              </li>

            <% } %>

            <% if ( video.stats.dislikeCount ) { %>
              <li>
                <span class="visuallyhidden">Dislikes:</span>
                <svg class="icon icon--grey">
                  <use xlink:href="/icons-<%= hash.svg %>.svg#dislike" />
                </svg>
                <%= video.stats.dislikeCount %>
              </li>

            <% } %>

          </ul>

        <% } %>

        <% if ( video.tags && video.tags.length ) { %>

          <%=
            partial(
              'templates/partials/tags.tpl',
              {
                tags : video.tags
              }
            )
          %>

        <% }%>

      </div>

  <% } );%>

</ul>
