<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />

	<link href="https://fonts.googleapis.com/css?family=Arvo:400,700" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">

</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />

<input hidden type="checkbox" id="menu-checker">
<div id="wrapper">
	<header id="banner" role="banner">
		<div class="container flex align-center">
			<div id="heading">
				<h1 class="site-title">
					<a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						<img alt="${logo_description}" height="50" src="${site_logo}" width="50" />
						<#if show_site_name>
							<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
								${site_name}
							</span>
						</#if>
					</a>
				</h1>
			</div>

			<#if !is_signed_in>
				<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
			</#if>
		</div>
			
		<#if has_navigation && is_setup_complete>
			<#include "${full_templates_path}/navigation.ftl" />
		</#if>

	</header>

	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>
		<div class="container">
			<!--
			<nav id="breadcrumbs">
				<@liferay.breadcrumbs />
			</nav>
			 -->
		
			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</div>

	</section>

	<footer id="footer" role="contentinfo">
		<div class="wrapper">
			<p class="powered-by">
				<@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a>
			</p>
		</div>
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->

</body>

</html>