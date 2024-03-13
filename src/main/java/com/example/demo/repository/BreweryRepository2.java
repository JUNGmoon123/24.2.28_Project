package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Brewery2;

@Mapper
public interface BreweryRepository2 {
	
	
	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM CSV AS C
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'barName'">
						AND C.barName LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'barAddr'">
						AND C.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND C.barName LIKE CONCAT('%',#{searchKeyword},'%')
						OR C.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);

	@Select("""
			<script>
			SELECT C.*, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
			FROM CSV AS C
			INNER JOIN `member` AS M
			ON C.memberId = M.id
			LEFT JOIN `reply` AS R
			ON C.id = R.relId
			WHERE 1
			<if test="boardId != 0">
				AND C.boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'barName'">
						AND C.barName LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'barAddr'">
						AND C.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND C.barName LIKE CONCAT('%',#{searchKeyword},'%')
						OR C.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			GROUP BY C.id
			ORDER BY C.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>
			</script>
			""")
	public List<Brewery2> getForPrintBrewerys(int boardId, int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);
	
}
