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
			FROM brewery AS B
			WHERE 1
			<if test="id != 0">
				AND id = #{id}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'barName'">
						AND B.barName LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'barAddr'">
						AND B.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND B.barName LIKE CONCAT('%',#{searchKeyword},'%')
						OR B.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getArticlesCount(int id, String searchKeywordTypeCode, String searchKeyword);

	@Select("""
			<script>
			SELECT B.*, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
			FROM brewery AS B
			INNER JOIN `member` AS M
			ON P.memberId = M.id
			LEFT JOIN `reply` AS R
			ON P.id = R.relId
			WHERE 1
			<if test="id != 0">
				AND P.id = #{id}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'barName'">
						AND B.barName LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'barAddr'">
						AND B.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND B.barName LIKE CONCAT('%',#{searchKeyword},'%')
						OR B.barAddr LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			GROUP BY B.id
			ORDER BY B.id DESC
			<if test="limitFrom >= 0 ">
				LIMIT #{limitFrom}, #{limitTake}
			</if>
			</script>
			""")
	public List<Brewery> getForPrintBrewerys(int id, int limitFrom, int limitTake, String searchKeywordTypeCode,
			String searchKeyword);
	
}
