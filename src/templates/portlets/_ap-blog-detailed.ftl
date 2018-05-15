<#-- https://web.liferay.com/community/forums/-/message_boards/message/64589715 -->
<#-- Calling the services -->
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService") />
<#assign assetLinkLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetLinkLocalService") />
<#assign assetEntryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetEntryLocalService") />

<#-- Get current entry assets -->
<#assign currentArticle = journalArticleLocalService.getArticle(groupId, .vars['reserved-article-id'].data) />
<#assign currentArticleResourcePrimKey = currentArticle.getResourcePrimKey() />
<#assign currentArticleAssetEntry = assetEntryLocalService.getEntry("com.liferay.journal.model.JournalArticle", currentArticleResourcePrimKey) />
<#assign currentArticleAssetEntryId = currentArticleAssetEntry.getEntryId() />
<#assign currentArticleRelatedLinks = assetLinkLocalService.getDirectLinks(currentArticleAssetEntryId) />

<#-- Title and Author Details -->
<#assign 
    articleTitle = .vars['reserved-article-title'].data
    articleDesc = .vars['reserved-article-description'].data
    authorId = .vars['reserved-article-author-id'].data?number
    authorName = .vars['reserved-article-author-name'].data
/>

<#-- Post Link -->
<#assign
    postURL = themeDisplay.getPortalURL() + themeDisplay.getURLCurrent()
    facebookURL = "http://www.facebook.com/sharer.php?u="+postURL
    twitterURL = "https://twitter.com/intent/tweet?text="+articleDesc+"...&tw_p=tweetbutton&url="+postURL
    linkedinURL = "https://www.linkedin.com/shareArticle?mini=true&url="+postURL+"&summary="+articleDesc+"..."
/>

<article>
    <header class="post-header">
        <h1>${articleTitle}</h1>
        <h2>${articleDesc}</h2>
        <div class="flex-container post-details padding-tb-25 border-tb">
            <div class="flex-item-expand">
                <@liferay_ui["user-display"]
                    markupView="lexicon"
                    showUserDetails=true
                    showUserName=true
                    userId=authorId
                    userName=authorName
                />
            </div>
            <div class="share-container">
                <a class="btn btn-default" title="Share on Twitter" target="_blank" href="${twitterURL}">
                    <@liferay_ui["icon"] icon="twitter" markupView="glyphicons" message="Share on Twitter" />
                </a>
                <a class="btn btn-default" title="Share on Facebook" target="_blank" href="${facebookURL}">
                    <@liferay_ui["icon"] icon="facebook" markupView="glyphicons" message="Share on Facebook" />
                </a>
                <a class="btn btn-default" title="Share on LinkedIn" target="_blank" href="${linkedinURL}">
                    <@liferay_ui["icon"] icon="linkedin" markupView="glyphicons" message="Share on LinkedIn" />
                </a>
            </div>
        </div>
    </header>

    <div class="content padding-tb-25">
        <figure>
            <div class="img-cover" style="background: url(${CoverImg.getData()}) center/cover">
                <img class="hide-accessible" src="${CoverImg.getData()}" />
            </div>
            <#if figureCaption??>
                <figcaption>
                    <p>${figureCaption.getData()}</p>
                </figcaption>
            </#if>
        </figure>
        <div class="content-text">
            ${BlogPostContent.getData()}
        </div>
    </div>

    <div class="padding-tb-25">
        <h4>Read More</h4>
        <div class="flex-container flex-container-stacked-xxs related-assets">
            <#list currentArticleRelatedLinks as related_entry>
                <#assign relatedAssetEntryId = related_entry.getEntryId2() />
                <#assign relatedAssetEntry = assetEntryLocalService.getEntry(relatedAssetEntryId) />
                <#assign relatedAssetEntryPrimKey = relatedAssetEntry.getClassPK() />
                <#assign relatedArticle = journalArticleLocalService.getLatestArticle(relatedAssetEntryPrimKey) />
                <#assign relatedArticleId = relatedArticle.getArticleId() />

                <#-- "Build" the URL -->
                <#assign relatedArticleURL = themeDisplay.getPortalURL() + "/web" + themeDisplay.getLayout().getGroup().getFriendlyURL() + "/-/" + relatedArticle.getUrlTitle() >

                <div class="related-entry">
                    <div>
                        <div class="cover" style="background: url(${relatedArticle.getArticleImageURL(themeDisplay)}) center/cover">
                            <img class="hide-accessible" src="${relatedArticle.getArticleImageURL(themeDisplay)}" alt="${relatedArticle.getTitle(locale)}">
                        </div>
                        <div class="text">
                            <h3>${relatedArticle.getTitle(locale)}</h3>
                            <p>${relatedArticle.description}</p>
                        </div>
                        <a href="${relatedArticleURL}" class="asset-link"></a>
                    </div>
                </div>
            </#list>
        </div>
    </div>

</article>