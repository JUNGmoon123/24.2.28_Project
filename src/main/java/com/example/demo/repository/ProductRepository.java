package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Product;


@Mapper
public interface ProductRepository {
	
	
	@Select("""
			<script>
			SELECT COUNT(*) AS cnt
			FROM product AS A
			WHERE 1
			<if test="boardId != 0">
				AND boardId = #{boardId}
			</if>
			<if test="searchKeyword != ''">
				<choose>
					<when test="searchKeywordTypeCode == 'title'">
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<when test="searchKeywordTypeCode == 'body'">
						AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</when>
					<otherwise>
						AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
						OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
					</otherwise>
				</choose>
			</if>
			ORDER BY id DESC
			</script>
			""")
	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);
}
