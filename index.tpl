<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <title>Single-Page Applications с AngularJS</title>

        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <link rel="stylesheet" href="bower_components/reveal.js/css/reveal.min.css">
        <link rel="stylesheet" href="./css/serif.css">
        <link rel="stylesheet" href="./css/styles.css">

        <!-- For syntax highlighting -->
        <link rel="stylesheet" href="bower_components/reveal.js/lib/css/zenburn.css" id="highlight-theme">

        <!-- If the query includes 'print-pdf', use the PDF print sheet -->
        <script>
          document.write( '<link rel="stylesheet" href="bower_components/reveal.js/css/print/' + ( window.location.search.match( /print-pdf/gi ) ? 'pdf' : 'paper' ) + '.css" type="text/css" media="print">' );
        </script>

        <!--[if lt IE 9]>
        <script src="lib/js/html5shiv.js"></script>
        <![endif]-->
    </head>

    <body>

        <div class="reveal">

            <div class="slides">

                <% _.forEach(slides, function(slide) { %>
                    <% if (_.isString(slide)) { %>
                        <% if (slide.indexOf('.html') !== -1) { %>
                            <section data-html="slides/<%= slide %>"></section>
                        <% } else { if (slide.indexOf('.md') !== -1) { %>
                            <section data-markdown="slides/<%= slide %>"></section>
                        <% }} %>
                    <% } else { if (_.isArray(slide)) { %>
                        <section>
                            <% _.forEach(slide, function(verticalslide) { %>
                                <% if (verticalslide.indexOf('.html') !== -1) { %>
                                    <section data-html="slides/<%= verticalslide %>"></section>
                                <% } else { if (verticalslide.indexOf('.md') !== -1) { %>
                                    <section data-markdown="slides/<%= verticalslide %>"></section>
                                <% }} %>
                            <% }); %>
                        </section>
                    <% }} %>
                <% }); %>

            </div>

        </div>

        <script src="bower_components/reveal.js/lib/js/head.min.js"></script>
        <script src="bower_components/reveal.js/js/reveal.min.js"></script>
        <script>
            // Configure Reveal
            // Full list of configuration options available here:
            // https://github.com/hakimel/reveal.js#configuration
            Reveal.initialize({
                controls: false,
                progress: true,
                history: true,
                center: true,

                theme: Reveal.getQueryHash().theme, // available themes are in /css/theme
                transition: 'linear',

                // Optional libraries used to extend on reveal.js
                dependencies: [
                    { src: 'bower_components/reveal.js/lib/js/classList.js', condition: function() { return !document.body.classList; } },
                    { src: 'bower_components/reveal.js/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
                    { src: 'bower_components/reveal.js/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
                    { src: 'bower_components/reveal.js/plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
                    { src: 'bower_components/reveal.js/plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
                    { src: 'bower_components/reveal.js/plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } },
                    // { src: 'plugin/search/search.js', async: true, condition: function() { return !!document.body.classList; } }
                    //{ src: 'bower_components/reveal.js/plugin/remotes/remotes.js', async: true, condition: function() { return !!document.body.classList; } }

                    { src: 'js/loadhtmlslides.js', condition: function() { return !!document.querySelector( '[data-html]' ); } }
                ]
            });
            Reveal.addEventListener('jungle-slide', function () {
              setTimeout(function () {
                document.getElementsByClassName('jungle-text')[0].classList.add('jungle-text-show');
              }, 2000);
            });
            Reveal.addEventListener('separationofconcerns-slide', function () {
              function animateStroke(path, duration) {
                path.style.visibility = 'visible';
                var length = path.getTotalLength();
                path.style.transition = path.style.WebkitTransition =
                  'none';
                path.style.strokeDasharray = length + ' ' + length;
                path.style.strokeDashoffset = length;
                path.getBoundingClientRect();
                path.style.transition = path.style.WebkitTransition =
                  'stroke-dashoffset ' + duration + 's ease-in-out';
                path.style.strokeDashoffset = '0';
              }
              setTimeout(function () {
                animateStroke(document.querySelector('#s1'), 1);
                setTimeout(function () {
                  animateStroke(document.querySelector('#s2'), 1);
                }, 1000);
              }, 500);
            });
            Reveal.addEventListener('blink', function (e) {
              var BLINK_DURATION = 500;
              var el = document.getElementById('blink');
              hideElement(el);
              function hideElement(el) {
                el.style.visibility = 'hidden';
                setTimeout(function () {
                  showElement(el);
                }, BLINK_DURATION);
              }

              function showElement(el) {
                el.style.visibility = 'visible';
                setTimeout(function () {
                  hideElement(el);
                }, BLINK_DURATION);
              }
            });

        </script>

        <script type="text/javascript">

          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-18060688-3']);
          _gaq.push(['_trackPageview']);

          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();

        </script>

    </body>

</html>
