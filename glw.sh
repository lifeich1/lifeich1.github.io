glw () {
    git -C $1 \
        log --graph --pretty='%h - %s (%as) <%an>' \
        --since="1 week ago"
}

