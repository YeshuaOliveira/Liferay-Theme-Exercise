<nav class="${nav_css_class}" id="navigation" role="navigation">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>
	

	<div class="container">
		<label aria-hidden for="menu-checker">
			<div>
				<svg width="30" height="30" xmlns="http://www.w3.org/2000/svg">
				  <path fill="#fff" d="M4.208 13.25h21.584c.943 0 1.708.765 1.708 1.708v.084c0 .943-.765 1.708-1.708 1.708H4.208A1.708 1.708 0 0 1 2.5 15.042v-.084c0-.943.765-1.708 1.708-1.708z"/>
				  <path fill="#fff" d="M4.208 19.25h21.584c.943 0 1.708.765 1.708 1.708v.084c0 .943-.765 1.708-1.708 1.708H4.208A1.708 1.708 0 0 1 2.5 21.042v-.084c0-.943.765-1.708 1.708-1.708z"/>
				  <path fill="#fff" d="M4.208 7.25h21.584c.943 0 1.708.765 1.708 1.708v.084c0 .943-.765 1.708-1.708 1.708H4.208A1.708 1.708 0 0 1 2.5 9.042v-.084c0-.943.765-1.708 1.708-1.708z"/>
				</svg>
			</div>
		</label>

		<ul aria-label="<@liferay.language key="site-pages" />" class="wrapper" role="menubar">

			<li id="search">
				<@liferay_portlet["runtime"]
				    portletName="com_liferay_portal_search_web_portlet_SearchPortlet"
				/>
			</li>

			<#list nav_items as nav_item>
				<#assign
					nav_item_attr_has_popup = ""
					nav_item_attr_selected = ""
					nav_item_css_class = ""
					nav_item_layout = nav_item.getLayout()
				/>

				<#if nav_item.isSelected()>
					<#assign
						nav_item_attr_has_popup = "aria-haspopup='true'"
						nav_item_attr_selected = "aria-selected='true'"
						nav_item_css_class = "selected"
					/>
				</#if>

				<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
					<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>

					<#if nav_item.hasChildren()>
						<ul class="child-menu" role="menu">
							<#list nav_item.getChildren() as nav_child>
								<#assign
									nav_child_attr_selected = ""
									nav_child_css_class = ""
								/>

								<#if nav_item.isSelected()>
									<#assign
										nav_child_attr_selected = "aria-selected='true'"
										nav_child_css_class = "selected"
									/>
								</#if>

								<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
									<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
								</li>
							</#list>
						</ul>
					</#if>
				</li>
			</#list>
		</ul>

	</div>
</nav>