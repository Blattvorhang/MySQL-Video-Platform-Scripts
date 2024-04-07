SELECT user.name
FROM user
JOIN (
    SELECT message.user_id
    FROM message
    WHERE message.description = '2052902喜欢看动作电影'
) AS filtered_message ON user.id = filtered_message.user_id
JOIN user_video_collect AS collect ON user.id = collect.user_id
JOIN video ON collect.video_id = video.id
GROUP BY user.id
HAVING AVG(video.score) > 2;