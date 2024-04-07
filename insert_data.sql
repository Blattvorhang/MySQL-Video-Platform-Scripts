INSERT INTO user (id, name, password)
VALUES
    (1, 'Alice', 'password1'),
    (2, 'Bob', 'password2'),
    (3, 'Charlie', 'password3'),
    (4, 'David', 'password4'),
    (5, 'Eve', 'password5'),
    (6, 'Frank', 'password6'),
    (7, 'Grace', 'password7'),
    (8, 'Helen', 'password8'),
    (9, 'Ivy', 'password9'),
    (10, 'Jack', 'password10');

INSERT INTO video (id, name, type, score, starring, date, description, path)
VALUES
    (1, 'Blockbuster Action', 'Action', 8.9, 'Actor1, Actor2', '2022-05-01', 'High-octane action movie.', '/path/to/movie1.mp4'),
    (2, 'Hilarious Comedy', 'Comedy', 7.6, 'Actress1, Actress2', '2021-09-15', 'Laugh-out-loud comedy.', '/path/to/movie2.mp4'),
    (3, 'Gripping Drama', 'Drama', 9.0, 'Actor3, Actress3', '2023-03-20', 'Emotionally-charged drama.', '/path/to/movie3.mp4'),
    (4, 'Futuristic Sci-Fi', 'Sci-Fi', 4.2, 'Actor4, Actress4', '2022-11-10', 'Mind-bending sci-fi adventure.', '/path/to/movie4.mp4'),
    (5, 'Romantic Affair', 'Romance', 7.2, 'Actor5, Actress5', '2021-06-30', 'Heartwarming romance story.', '/path/to/movie5.mp4'),
    (6, 'Intense Action Thriller', 'Action', 8.5, 'Actor6, Actress6', '2023-01-15', 'Thrilling action-packed movie.', '/path/to/movie6.mp4'),
    (7, 'Awful Drama', 'Drama', 1.5, 'Actor7, Actress7', '2022-08-20', 'Terribly executed drama.', '/path/to/movie7.mp4'),
    (8, 'Unfunny Comedy', 'Comedy', 1.8, 'Actress7, Actor8', '2021-11-05', 'Painfully unfunny comedy.', '/path/to/movie8.mp4'),
    (9, 'Terrible Sci-Fi', 'Sci-Fi', 0.9, 'Actor9, Actress9', '2023-02-18', 'Disastrous sci-fi movie.', '/path/to/movie9.mp4'),
    (10, 'Unbearable Romance', 'Romance', 1.2, 'Actor10, Actress10', '2022-06-01', 'Excruciatingly dull romance.', '/path/to/movie10.mp4');

INSERT INTO message (user_id, description, date)
VALUES  -- 2052902喜欢看动作电影: 2, 3, 4, 5, 7, 8, 10
    (1, '最近超爱看动作片,太刺激了!', '2023-04-01'),
    (2, '2052902喜欢看动作电影', '2023-03-25'),
    (3, '剧情片真是太有意思了,入迷了!', '2023-04-05'),
    (1, '科幻片太炫酷了,太有创意了!', '2023-03-30'), 
    (4, '爱情片太温馨了,超级感动!', '2023-04-02'),
    (5, '最爱看惊悚片,太刺激了!', '2023-04-04'),
    (2, '最近特别迷恋喜剧片,太好笑了!', '2023-04-06'),
    (3, '2052902喜欢看动作电影', '2023-04-03'),
    (4, '科幻片太酷了,太有想象力了!', '2023-04-07'),
    (5, '2052902喜欢看动作电影', '2023-04-05'),
    (6, '惊悚片太刺激了,太过瘾了!', '2023-04-08'),
    (10, '2052902喜欢看动作电影', '2023-04-09'),
    (8, '科幻片太炫酷了,太有创意了!', '2023-04-10'),
    (9, '爱情片太温馨了,超级感动!', '2023-04-11'),
    (10, '最爱看惊悚片,太刺激了!', '2023-04-12'),
    (8, '2052902喜欢看动作电影', '2023-04-13'),
    (7, '科幻片太酷了,太有想象力了!', '2023-04-14'),
    (7, '2052902喜欢看动作电影', '2023-04-15'),
    (4, '2052902喜欢看动作电影', '2023-04-17');

INSERT INTO user_video_collect (user_id, video_id)
VALUES
    (1, 1), (1, 2), (1, 3), (1, 8),
    (2, 4), (2, 5), (2, 6),           -- AVG(video.score) = 6.63
    (3, 8),                           -- AVG(video.score) = 1.8
    (4, 8), (4, 9), (4, 10),          -- AVG(video.score) = 1.3
    (5, 1), (5, 4), (5, 7),           -- AVG(video.score) = 4.87
    (6, 2), (6, 5), (6, 8),
    (7, 4), (7, 7), (7, 9), (7, 10),  -- AVG(video.score) = 1.95
    (8, 1), (8, 4),                   -- AVG(video.score) = 6.55
    (9, 2), (9, 5), (9, 8),
    (10, 3), (10, 6), (10, 9);        -- AVG(video.score) = 6.13

-- Used for testing
SELECT user.id, user.name, AVG(video.score) AS avg_score
FROM user
JOIN (
    SELECT message.user_id
    FROM message
    WHERE message.description = '2052902喜欢看动作电影'
) AS filtered_message ON user.id = filtered_message.user_id
JOIN user_video_collect AS collect ON user.id = collect.user_id
JOIN video ON collect.video_id = video.id
GROUP BY user.id
ORDER BY user.id;