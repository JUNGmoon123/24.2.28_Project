package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Beer;
import com.example.demo.vo.CSV;

@Mapper
public interface BeerRepository {

	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM beers AS B
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'btype'">
						AND B.btype LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'model'">
						AND B.model LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND B.btype LIKE CONCAT('%',#{searchKeyword},'%')
						OR B.model LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
				        <if test="btype != ''">
			          AND B.btype = #{btype}
			      </if>
			ORDER BY id DESC
			</script>
			""")

	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword, String btype);

	@Select("""
			<script>
			SELECT B.*
			FROM beers AS B
			WHERE 1
			<if test="boardId != 0">
			    AND B.boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
			    <choose>
			        <when test="searchKeywordTypeCode == 'btype'">
			            AND B.btype LIKE CONCAT('%',#{searchKeyword},'%')
			        </when>
			        <when test="searchKeywordTypeCode == 'model'">
			            AND B.model LIKE CONCAT('%',#{searchKeyword},'%')
			        </when>
			        <otherwise>
			            AND (B.btype LIKE CONCAT('%',#{searchKeyword},'%')
			            OR B.model LIKE CONCAT('%',#{searchKeyword},'%'))
			        </otherwise>
			    </choose>
			</if>
			<if test="btype != ''">
			    AND B.btype = #{btype}
			</if>
			ORDER BY B.id ASC
			<if test="offset >= 0 and limit > 0">
			    LIMIT #{limit} OFFSET #{offset}
			</if>
			</script>
			""")
	public List<Beer> getForPrintBeers(int boardId, String searchKeywordTypeCode, String searchKeyword,
			String btype, int offset, int limit);

	@Select("""
			SELECT *
			FROM beers
			WHERE id = #{id}
			""")
	public Beer getForPrintBeer(int id);

//	@Select("""
//			SELECT * 
//			FROM beers
//			ORDER BY id ASC
//			""")
//	public List<Beer> selectList();

}
