package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Brewery;

@Mapper
public interface BreweryRepository {
	
	
	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM product AS P
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'productName'">
						AND P.productName LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND P.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND P.productName LIKE CONCAT('%',#{searchKeyword},'%')
						OR P.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);

	@Select("""
			<script>
			SELECT P.*, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
			FROM product AS P
			INNER JOIN `member` AS M
			ON P.memberId = M.id
			LEFT JOIN `reply` AS R
			ON P.id = R.relId
			WHERE 1
			<if test="boardId != 0">
				AND P.boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'productName'">
						AND P.productName LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND P.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND P.productName LIKE CONCAT('%',#{searchKeyword},'%')
						OR P.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			GROUP BY P.id
			ORDER BY P.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>
			</script>
			""")
	public List<Brewery> getForPrintBrewerys(int boardId, int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);
	
}
