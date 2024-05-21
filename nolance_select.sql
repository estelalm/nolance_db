select * from tbl_subcategoria join tbl_categoria on tbl_subcategoria.categoria_id=tbl_categoria.id where tbl_categoria.id = 1;
select tbl_subcategoria.id, tbl_subcategoria.nome from tbl_subcategoria join tbl_categoria on tbl_subcategoria.categoria_id=tbl_categoria.id
         where tbl_categoria.id = 1;