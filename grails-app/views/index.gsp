<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Virtual Courthouse</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<div id="status" role="complementary">
			<h1>Application Version</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>The Edge</h1>
			<p></p>

			<div id="controller-list" role="navigation">
				<h2>MENU:</h2>
				<ul>
				<li><a href="${createLink(controller: 'login')}">LOGIN</a></li>
				<li><a href="${createLink(controller: 'logout')}">LOGOUT</a></li>
				</ul>
				<sec:ifAllGranted roles="ROLE_INDEXER">
				<ul>
					<li>INDEXER:</li>
					<li><a href="${createLink(controller: 'assignment', action: 'index')}">View Assignments</a></li>
					<li><a href="${createLink(controller: 'document', action: 'index')}">View Unsubmitted Documents</a></li>
				</ul>
				</sec:ifAllGranted>
				<sec:ifAllGranted roles="ROLE_REVIEWER">
				<ul>
					<li>REVIEWER:</li>
					<li><a href="${createLink(controller: 'document', action: 'index')}">Documents to Review</a></li>
				</ul>
				</sec:ifAllGranted>
				<sec:ifAllGranted roles="ROLE_SUPERVISOR">
				<ul>
					<li>SUPERVISOR:</li>
					<li><a href="${createLink(controller: 'assignment', action: 'index')}">Manage Assignments</a></li>
				</ul>
				</sec:ifAllGranted>
				<sec:ifAllGranted roles="ROLE_ADMIN">
				<ul>
					<li>ADMIN:</li>
					<li><a href="${createLink(controller: 'assignment', action: 'index')}">Manage Assignments</a></li>
				</ul>
				</sec:ifAllGranted>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>
		</div>
	</body>
</html>
