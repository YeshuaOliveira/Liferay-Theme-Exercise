<#if entries?has_content>
    <aside class="blog-sidebar">
        <#list entries as curEntry>
            
            <#assign assetRenderer = curEntry.getAssetRenderer() />
            <#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, curEntry) />

            <#assign
                blogDate = curEntry.createDate?datetime
                diff = (.now?datetime?long - blogDate?long)    <#-- diff in millis -->
                diff_h = diff / (1000 * 60 * 60)               <#-- diff in hours -->
                diff_d = diff_h / 24                           <#-- diff in days -->
            />

            <#if diff_h &lt; 24>
                <#assign diff_str = diff_h?round?int + "h" />
            <#else>
                <#assign diff_str = diff_d?round?int + "d" />
            </#if>

            <section class="">
                <a href="${viewURL}">
                    <#if curEntry.getAssetRenderer().getThumbnailPath(renderRequest) != "">
                        <figure>
                            <div class="cover-img" style="background: url(${curEntry.getAssetRenderer().getThumbnailPath(renderRequest)}) center/cover">
                                <img class="hide-accessible" src="${curEntry.getAssetRenderer().getThumbnailPath(renderRequest)}" alt="${curEntry.getTitle(locale)}" />
                            </div>
                        </figure>
                    </#if>
                    <h3>
                        <span>${curEntry.getTitle(locale)}</span>
                    </h3>
                    <span class="label label-default time">
                        <@liferay_ui['icon'] icon="time" markupView="glyphicon"/>
                        <span class="text">${diff_str}</span>
                    </span>
                </a>
            </section>
        </#list>
    </aside>
</#if>