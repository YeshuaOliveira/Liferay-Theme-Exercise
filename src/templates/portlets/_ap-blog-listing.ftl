<#if entries?has_content>
    <div class="blog-list">
    <#list entries as curEntry>
        
        <#-- link to the context page -->
        <#assign assetRenderer = curEntry.getAssetRenderer() />
        <#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, assetRenderer.getUrlTitle()) />

        ${assetRenderer.getUrlTitle()}

        <#-- script for the time difference -->
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

        <#-- defines the sharer URLs -->
        <#assign facebookURL = "http://www.facebook.com/sharer.php?u="+viewURL />
        <#assign twitterURL = "https://twitter.com/intent/tweet?tw_p=tweetbutton&url="+viewURL />
        <#assign linkedinURL = "https://www.linkedin.com/shareArticle?mini=true&url="+viewURL />

        <article class="entry flex-container flex-container-stacked-xs">
            <p class="date">
                <span><@liferay_ui["icon"] icon="time" markupView="glyphicons" /></span>
                <span>${diff_str}</span>
            </p>

            <#if curEntry.getAssetRenderer().getThumbnailPath(renderRequest) != "">
                <figure class="cover-img" style="background: url(${curEntry.getAssetRenderer().getThumbnailPath(renderRequest)}) center/cover">
                    <img class="hide-accessible" src="${curEntry.getAssetRenderer().getThumbnailPath(renderRequest)}" alt="" />
                    <figcaption class="hide-accessible">
                        <p>${curEntry.getDescription(locale)}</p>
                    </figcaption>
                </figure>
            </#if>

            <div class="flex-container flex-container-stacked-xs article-content flex-item-expand">

                <#-- Get the Tags from the post -->
                <#assign AssetTagLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetTagLocalService")>
                <#assign entryTags = AssetTagLocalService.getEntryTags(curEntry.entryId)>

                <#-- Get the Category from the post -->
                <#assign AssetCategoryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService")>
                <#assign entryCategories = AssetCategoryLocalService.getCategories(curEntry.classNameId, curEntry.classPK)>

                <#-- Since it returns a ArrayList, we need to get the first one -->
                <#assign firstCatergory = entryCategories?first >
                


                <section class="content">
                    <p class="categories"><a href="${themeDisplay.getURLPortal()}/${firstCatergory.name}">${firstCatergory.name}</a></p>
                    <h2><span>${curEntry.getTitle(locale)}</span></h2>
                    <p><span>${curEntry.getDescription(locale)}</span></p>
                </section>
                <footer class="flex-container">
                    <div class="user flex-item-expand">
                        <@liferay_ui["user-display"]
                            markupView="lexicon"
                            showUserDetails=false
                            showUserName=true
                            userId=curEntry.userId
                            userName=curEntry.userName
                        />
                    </div>
                    <div class="share-container">
                        <a class="btn btn-default" title="Share on Twitter" target="_blank" href="${twitterURL}"><@liferay_ui["icon"] icon="twitter" markupView="glyphicons" message="Share on Twitter" /></a>
                        <a class="btn btn-default" title="Share on Facebook" target="_blank" href="${facebookURL}"><@liferay_ui["icon"] icon="facebook" markupView="glyphicons" message="Share on Facebook" /></a>
                        <a class="btn btn-default" title="Share on LinkedIn" target="_blank" href="${linkedinURL}"><@liferay_ui["icon"] icon="linkedin" markupView="glyphicons" message="Share on LinkedIn" /></a>
                    </div>
                </footer>
            </div>
            <a class="blog-link" href="${viewURL}" title="${curEntry.getTitle(locale)}"></a>
        </article>
        <div class="separator"></div>
    </#list>
    </div>
</#if>