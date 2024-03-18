DROP DATABASE IF EXISTS `project`;
CREATE DATABASE `project`;
USE `project`;

# article 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(100) NOT NULL,
    `body` TEXT NOT NULL
);

# member 테이블 생성
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(80) NOT NULL,
    `authLevel` SMALLINT(2) UNSIGNED DEFAULT 3 COMMENT '권한 레벨 (3=일반,7=관리자)',
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL,
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '탈퇴 여부 (0=탈퇴 전, 1=탈퇴 후)',
    delDate DATETIME COMMENT '탈퇴 날짜'
);


# article TD 생성
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# member TD 생성
# (관리자)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`authLevel` = 7,
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01012341234',
email = 'abcd@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '회원1',
nickname = '회원1',
cellphoneNum = '01043214321',
email = 'abcde@gmail.com';

# (일반)
INSERT INTO `member`
SET regDate = NOW(),
updateDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '회원2',
nickname = '회원2',
cellphoneNum = '01056785678',
email = 'abcdef@gmail.com';

ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;

UPDATE article
SET memberId = 2
WHERE id IN (1,2);

UPDATE article
SET memberId = 3
WHERE id IN (3,4);


# board 테이블 생성
CREATE TABLE board(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `code` CHAR(50) NOT NULL UNIQUE COMMENT 'notice(공지사항), free(자유), QnA(질의응답) ...',
    `name` CHAR(20) NOT NULL UNIQUE COMMENT '게시판 이름',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '삭제 여부 (0=삭제 전, 1=삭제 후)',
    delDate DATETIME COMMENT '삭제 날짜'
);

# board TD 생성
INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'NOTICE',
`name` = '공지사항';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE',
`name` = '자유';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'QnA',
`name` = '질의응답';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE1',
`name` = '자유게시판';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE2',
`name` = '술리뷰';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'FREE3',
`name` = '와이너리리뷰';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'BREWERY',
`name` = '양조장';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'BEER',
`name` = '술';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'BREWERY2',
`name` = '양조장2';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'BREWERY',
`name` = '와이너리';

INSERT INTO board
SET regDate = NOW(),
updateDate = NOW(),
`code` = 'BEER',
`name` = '술상품';

ALTER TABLE article ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE article
SET boardId = 1
WHERE id IN (1,2);

UPDATE article
SET boardId = 2
WHERE id = 3;

UPDATE article
SET boardId = 3
WHERE id = 4;

ALTER TABLE article ADD COLUMN hitCount INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER `body`;

# reactionPoint 테이블 생성
CREATE TABLE reactionPoint(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `point` INT(10) NOT NULL
);

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 1번 회원이 2번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'article',
relId = 2,
`point` = 1;

# 2번 회원이 1번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`point` = -1;

# 2번 회원이 2번 글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`point` = -1;

# 3번 회원이 1번 글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`point` = 1;

# article 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE article ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE article ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE article AS A
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON A.id = RP_SUM.relId
SET A.goodReactionPoint = RP_SUM.goodReactionPoint,
A.badReactionPoint = RP_SUM.badReactionPoint;

# reply 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    relTypeCode CHAR(50) NOT NULL COMMENT '관련 데이터 타입 코드',
    relId INT(10) NOT NULL COMMENT '관련 데이터 번호',
    `body`TEXT NOT NULL
);

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 1';

# 2번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 2';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'article',
relId = 1,
`body` = '댓글 3';

# 3번 회원이 1번 글에 댓글 작성
INSERT INTO reply
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'article',
relId = 2,
`body` = '댓글 4';

# reply 테이블에 좋아요 관련 컬럼 추가
ALTER TABLE reply ADD COLUMN goodReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE reply ADD COLUMN badReactionPoint INT(10) UNSIGNED NOT NULL DEFAULT 0;

# reactionPoint 테스트 데이터 생성
# 1번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 1번 회원이 2번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
relTypeCode = 'reply',
relId = 2,
`point` = 1;

# 2번 회원이 1번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 1,
`point` = -1;

# 2번 회원이 2번 댓글에 싫어요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
relTypeCode = 'reply',
relId = 2,
`point` = -1;

# 3번 회원이 1번 댓글에 좋아요
INSERT INTO reactionPoint
SET regDate = NOW(),
updateDate = NOW(),
memberId = 3,
relTypeCode = 'reply',
relId = 1,
`point` = 1;

# update join -> 기존 게시물의 good,bad RP 값을 RP 테이블에서 가져온 데이터로 채운다
UPDATE reply AS R
INNER JOIN (
    SELECT RP.relTypeCode,RP.relId,
    SUM(IF(RP.point > 0, RP.point, 0)) AS goodReactionPoint,
    SUM(IF(RP.point < 0, RP.point * -1, 0)) AS badReactionPoint
    FROM reactionPoint AS RP
    GROUP BY RP.relTypeCode, RP.relId
) AS RP_SUM
ON R.id = RP_SUM.relId
SET R.goodReactionPoint = RP_SUM.goodReactionPoint,
R.badReactionPoint = RP_SUM.badReactionPoint;


# 상품테이블 생성
CREATE TABLE product(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    productName CHAR(50) NOT NULL,
    `body`TEXT NOT NULL,
    abv CHAR(20) NOT NULL,
    price CHAR(50) NOT NULL
);

ALTER TABLE product ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

#상품테스트 데이터
INSERT INTO product
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 9,
productName = '여우목',
`body` = '오미자 증류주',
abv = '40도',
price = '12000';

INSERT INTO product
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
boardId = 9,
productName = '강산명주',
`body` = '복분자주',
abv = '13도',
price = '3800';

INSERT INTO product
SET regDate = NOW(),
updateDate = NOW(),
memberId = 1,
boardId = 9,
productName = '고창명산품',
`body` = '복분자주',
abv = '18도',
price = '22800';

INSERT INTO product
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
boardId = 7,
productName = '로버트몬다비',
`body` = '와인',
abv = '18도',
price = '69000';

INSERT INTO product
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
boardId = 7,
productName = '파비아',
`body` = '와인',
abv = '18도',
price = '63000';

INSERT INTO product
SET regDate = NOW(),
updateDate = NOW(),
memberId = 2,
boardId = 7,
productName = '모엣 샹동 샴페인',
`body` = '샴페인',
abv = '18도',
price = '63000';

CREATE TABLE brewery(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    barName CHAR(50) NOT NULL,
    barAddr CHAR(50) NOT NULL,
    barNumber CHAR(50) NOT NULL,
    barWeb CHAR(50) NOT NULL
<<<<<<< HEAD
);

ALTER TABLE brewery ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER id;
ALTER TABLE brewery ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER id;


UPDATE brewery
SET boardId = 7
=======
    
);

ALTER TABLE brewery ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER `id`;
ALTER TABLE brewery ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `memberId`;

UPDATE brewery
SET boardId = 14
>>>>>>> a6be98d8fd1889e944fc823976c3c793c2065a2d
WHERE id BETWEEN 1 AND 50;

UPDATE brewery
SET memberId = 2
<<<<<<< HEAD
WHERE id BETWEEN 1 AND 24;

UPDATE brewery
SET memberId = 3
WHERE id BETWEEN 25 AND 50;


=======
WHERE id BETWEEN 1 AND 50;
>>>>>>> a6be98d8fd1889e944fc823976c3c793c2065a2d

CREATE TABLE beers(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    btype CHAR(50),
    model CHAR(50), 
    byear CHAR(50), 
    color CHAR(50), 
    price CHAR(50), 
    src VARCHAR(255) 
);
<<<<<<< HEAD
#model은 이름, btype은 선택기준 의미 
INSERT INTO beers (btype, model, byear, color, price, src) VALUES
('white', 'white와인', '2016', 'white', '16000', 'https://오아크.com/web/product/medium/202211/42ae59aaa0b992e6b4de509c1e89f34c.jpg'),
('red', 'red와인', '2015', 'red', '60000', 'https://오아크.com/web/product/medium/202211/f229d7a97041a31794ee25b213b88712.jpg'),
('white', 'white와인', '2022', 'white', '65000', 'https://오아크.com/web/product/medium/202211/bf679203e1c07b565179d7ed927587cb.jpg'),
('red', 'red와인', '2023', 'red', '50000', 'https://오아크.com/web/product/medium/202211/f229d7a97041a31794ee25b213b88712.jpg'),
('craft', '수제맥주', '2021', 'craft', '5000', 'https://ojsfile.ohmynews.com/STD_IMG_FILE/2021/0310/IE002771543_STD.jpg'),
('craft', '수제맥주', '1992', 'craft', '12000', 'https://images.emarteveryday.co.kr/images/app/webapps/evd_web2/share/SKU/mall/86/12/8809363881286_1.png'),
('craft', '수제맥주', '1993', 'craft', '8900', 'https://cdn.imweb.me/thumbnail/20210330/bc061fa6b54a1.jpg'),
('craft', '수제맥주', '1997', 'craft', '7000', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIwIgE2NTo-nkSlCnEe1lHqJht9bZSpuQxVA&usqp=CAU'),
('dark', '흑맥주', '2012', 'dark', '4000', 'https://image.mycelebs.com/beer/new/sq/241530_sq_00.jpg'),
('dark', '흑맥주', '2022', 'dark', '8000', 'https://blog.kakaocdn.net/dn/GPutK/btrHBBcHlfG/DdflRd2VHqDB2YslahdWoK/img.jpg'),
('cheongju', '보리소주', '2022', 'cheongju', '8000', 'https://godomall.speedycdn.net/ecde3d55747f2aa4dbec5952a29271fe/goods/1000001054/image/detail/1000001054_detail_056.jpg'),
('dark', '흑맥주', '2020', 'dark', '10000', 'https://gomean.co.kr/wp-content/uploads/2023/07/gm-dark-beer-main.jpg');

ALTER TABLE beers ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER id;

UPDATE beers
SET boardId = 8
WHERE id BETWEEN 1 AND 138;

######## CSV실험
CREATE TABLE CSV(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    barName CHAR(50) NOT NULL,
    barAddr CHAR(50) NOT NULL,
    barNumber CHAR(50) NOT NULL,
    barWeb CHAR(50) NOT NULL
);

ALTER TABLE CSV ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER id;
ALTER TABLE CSV ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER id;

UPDATE CSV
SET boardId = 15
WHERE id BETWEEN 1 AND 50;

UPDATE CSV
SET memberId = 2
WHERE id BETWEEN 1 AND 24;

UPDATE CSV
SET memberId = 3
WHERE id BETWEEN 25 AND 50;


###############################################
DROP TABLE brewery;
DROP TABLE CSV;
DROP TABLE beers;



SELECT * 
FROM beers
ORDER BY id;
=======

ALTER TABLE beers ADD COLUMN boardId INT(10) UNSIGNED NOT NULL AFTER `id`;

UPDATE beers
SET boardId = 15
WHERE id BETWEEN 1 AND 252;

###############################################
DROP TABLE brewery;
DROP TABLE beers;

SELECT * FROM beers;
>>>>>>> a6be98d8fd1889e944fc823976c3c793c2065a2d

SELECT * FROM brewery;

SELECT * FROM CSV;

SELECT * FROM article;

SELECT * FROM `member`;

SELECT * FROM `board`;

SELECT * FROM reactionPoint;

SELECT * FROM `reply`;

SELECT * FROM product;

SELECT * 
FROM product
WHERE boardId = 7;

SELECT * 
FROM beers
WHERE boardId = 16;

SELECT * 
FROM brewery
WHERE boardId = 14
GROUP BY id
ORDER BY id DESC;


SELECT goodReactionPoint
FROM article 
WHERE id = 1

INSERT INTO article
(
    regDate, updateDate, memberId, boardId, title, `body`
)
SELECT NOW(),NOW(), FLOOR(RAND() * 2) + 2, FLOOR(RAND() * 6) + 1, CONCAT('제목_',RAND()), CONCAT('내용_',RAND())
FROM article;

SELECT IFNULL(SUM(RP.point),0)
FROM reactionPoint AS RP
WHERE RP.relTypeCode = 'article'
AND RP.relId = 3
AND RP.memberId = 1;


UPDATE article 
SET title = '제목5'
WHERE id = 5;

UPDATE article 
SET title = '제목11'
WHERE id = 6;

UPDATE article 
SET title = '제목45'
WHERE id = 7;

SELECT FLOOR(RAND() * 2) + 2

SELECT FLOOR(RAND() * 3) + 1


SHOW FULL COLUMNS FROM `member`;
DESC `member`;



SELECT LAST_INSERT_ID();

SELECT *
FROM article AS A
WHERE 1
AND boardId = 1
AND A.title LIKE CONCAT('%','0000','%')
OR A.body LIKE CONCAT('%','0000','%')
ORDER BY id DESC

SELECT COUNT(*)
FROM article AS A
WHERE 1
AND boardId = 1
AND A.title LIKE CONCAT('%','0000','%')
OR A.body LIKE CONCAT('%','0000','%')
ORDER BY id DESC


SELECT hitCount
FROM article
WHERE id = 374;

SELECT A.*
FROM article AS A
WHERE A.id = 1

SELECT A.*, M.nickname AS extra__writer
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
WHERE A.id = 1

# LEFT JOIN
SELECT A.*, M.nickname AS extra__writer, RP.point
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 서브쿼리
SELECT A.*,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM (
    SELECT A.*, M.nickname AS extra__writer 
    FROM article AS A
    INNER JOIN `member` AS M
    ON A.memberId = M.id
    ) AS A
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;

# 조인
SELECT A.*, M.nickname AS extra__writer,
IFNULL(SUM(RP.point),0) AS extra__sumReactionPoint,
IFNULL(SUM(IF(RP.point > 0, RP.point, 0)),0) AS extra__goodReactionPoint,
IFNULL(SUM(IF(RP.point < 0, RP.point, 0)),0) AS extra__badReactionPoint
FROM article AS A
INNER JOIN `member` AS M
ON A.memberId = M.id
LEFT JOIN reactionPoint AS RP
ON A.id = RP.relId AND RP.relTypeCode = 'article'
GROUP BY A.id
ORDER BY A.id DESC;


SELECT *, COUNT(*)
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

SELECT IF(RP.point > 0, '큼','작음')
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId

# 각 게시물의 좋아요, 싫어요 갯수
SELECT RP.relTypeCode, RP.relId,
SUM(IF(RP.point > 0,RP.point,0)) AS goodReactionPoint,
SUM(IF(RP.point < 0,RP.point * -1,0)) AS badReactionPoint
FROM reactionPoint AS RP
GROUP BY RP.relTypeCode,RP.relId


DROP DATABASE IF EXISTS `project`;
CREATE DATABASE `project`;
USE `project`;