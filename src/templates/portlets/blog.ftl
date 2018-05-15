<#if entries?has_content>
    <section class="adt">
    <#list entries as curBlogEntry>

        <#assign blogId = curBlogEntry.entryId />

        <#-- defines the blog URL -->
        <#assign blogURL = renderResponse.createRenderURL() />
        ${blogURL.setParameter("urlTitle", curBlogEntry.getUrlTitle())}
        ${blogURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
        ${blogURL.setParameter("redirect", currentURL)}
        ${blogURL.setParameter("p_p_state", "maximized")}

        <#-- defines the sharer URLs -->
        <#assign facebookURL = "http://www.facebook.com/sharer.php?u="+blogURL />
        <#assign twitterURL = "https://twitter.com/intent/tweet?text="+curBlogEntry.content?substring(0,140)+"...&tw_p=tweetbutton&url="+blogURL />
        <#assign linkedinURL = "https://www.linkedin.com/shareArticle?mini=true&url="+blogURL+"&summary="+curBlogEntry.content?substring(0,140)+"..."/>

        <article class="entry">
            <div class="entry-body flex-container flex-container-stacked-xs">
                <p class="date" datetime="${curBlogEntry.createDate?datetime}">
                    <span><@liferay_ui["icon"] icon="time" markupView="glyphicons" /></span>
                    <time>${curBlogEntry.createDate?string["MM.dd.YYYY"]}</time>
                    <time>${curBlogEntry.createDate?string["HH:mm"]}</time>
                </p>
                <figure>
                    <a href="${blogURL}">
                        <img class="lazyload hide-accessible" src="${curBlogEntry.getSmallImageURL(themeDisplay)}" alt="IMage Decription">
                    </a>
                </figure>
                <div class="flex-container flex-container-stacked-xs article-content flex-item-expand">
                    <section class="content">
                        <h2><a href="home/-/blogs/${curBlogEntry.urlTitle}">${curBlogEntry.title}</a></h2>
                        <p><a href="home/-/blogs/${curBlogEntry.urlTitle}">${curBlogEntry.subtitle}</a></p>
                    </section>
                    <footer class="flex-container">
                        <div class="user flex-item-expand">
                            <@liferay_ui["user-display"]
                                markupView="lexicon"
                                showUserDetails=true
                                showUserName=true
                                userId=curBlogEntry.userId
                                userName=curBlogEntry.userName
                            />
                        </div>
                        <div class="share-container">
                            <a class="btn btn-default" title="Share on Twitter" target="_blank" href="${twitterURL}"><@liferay_ui["icon"] icon="twitter" markupView="glyphicons" message="Share on Twitter" /></a>
                            <a class="btn btn-default" title="Share on Facebook" target="_blank" href="${facebookURL}"><@liferay_ui["icon"] icon="facebook" markupView="glyphicons" message="Share on Facebook" /></a>
                            <a class="btn btn-default" title="Share on LinkedIn" target="_blank" href="${linkedinURL}"><@liferay_ui["icon"] icon="linkedin" markupView="glyphicons" message="Share on LinkedIn" /></a>
                        </div>
                    </footer>
                </div>
            </div>
        </article>
        <div class="separator"></div>
    </#list>
    </section>
</#if>