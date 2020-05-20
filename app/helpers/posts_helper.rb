module PostsHelper
    include ApplicationHelper

    def post_info(post)
        raw "#{glyphicon "user", link_to(post.user.name, post.user)} #{glyphicon "time", post.created_at} #{glyphicon "tag", link_to(post.category.name, post.category)} #{glyphicon "comment", post.comments.count} #{glyphicon "eye-open", post.views}"
    end
end
