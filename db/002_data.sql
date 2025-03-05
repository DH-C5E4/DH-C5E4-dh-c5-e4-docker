-- Estado de Productos
INSERT INTO product_status (description) VALUES 
('Active'),
('Inactive');

-- Categorías
INSERT INTO categories (is_active, title, description, cloudinary_folder,public_id,image) VALUES 
(true,'LArtClassique', 'Categoría de vajilla con diseños clásicos y elegantes','categories/LArtClassique','categories/LArtClassique/gcbofmixmbuqqma0hyon', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740962641/categories/LArtClassique/gcbofmixmbuqqma0hyon.webp'),

(true,'BohoChi', 'Estilo bohemio con patrones naturales y coloridos','categories/BohoChi','categories/BohoChi/ulfklzinfidlypecimpr', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740963062/categories/BohoChi/ulfklzinfidlypecimpr.webp'),

(true,'VintageElegance', 'Diseños vintage con toques elegantes','categories/VintageElegance','categories/VintageElegance/aitm5vz5xh78vhd9ksea', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740963496/categories/VintageElegance/aitm5vz5xh78vhd9ksea.webp'),

(true,'ModernMinimal', 'Estilo moderno con diseños limpios y minimalistas','categories/ModernMinimal','categories/ModernMinimal/dttiq231ilx5wjtml1rb', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740964090/categories/ModernMinimal/dttiq231ilx5wjtml1rb.webp'),

(true,'RusticLuxe', 'Combinación de lujo con elementos rústicos','categories/RusticLuxe/','categories/RusticLuxe/bsn4y3jjpewpluxy1val', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740964318/categories/RusticLuxe/bsn4y3jjpewpluxy1val.webp'),

(true,'JardinEnchanté', 'Inspiración en la naturaleza y jardines','categories/JardinEnchant%C3%A9','categories/JardinEnchant%C3%A9/sywsuihx6xdrsnoq1hfq', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740964333/categories/JardinEnchant%C3%A9/sywsuihx6xdrsnoq1hfq.webp');

-- Productos
INSERT INTO products (name, description, price, category_id, product_status_id, cloudinary_folder) VALUES 
('set imperial dorado', 'Elegante juego de vajilla con detalles dorados y diseño barroco.', 350.00, 1, 1, 'products/setimperialdorado'),
('coleccion real azul', 'Vajilla con tonos azul profundo y bordes dorados para cenas sofisticadas.', 420.00, 1, 1, 'products/coleccionrealazul'),

('set naturaleza boho', 'Vajilla con diseños florales en tonos tierra, perfecta para ambientes relajados.', 280.00, 2, 1,'products/setnaturalezaboho'),
('vajilla etnica organica', 'Inspirada en patrones étnicos con un toque moderno.', 310.00, 2, 1, 'products/vajillaetnicaorganica'),

('set perla azul', 'Delicada vajilla en tonos azul perla con bordes plateados.', 390.00, 3, 1, 'products/setperlaazul'),
('vajilla dorado majestuoso', 'Conjunto de platos con detalles dorados y cristalería elegante.', 450.00, 3, 1, 'products/vajilladoradomajestuoso'),

('set blanco puro', 'Vajilla monocromática con líneas modernas y minimalistas.', 260.00, 4, 1, 'products/setblancopuro'),
('vajilla negra contemporanea', 'Diseño moderno en color negro mate con detalles dorados.', 310.00, 4, 1, 'products/vajillanegracontemporanea'),

('set rustico campestre', 'Vajilla inspirada en la naturaleza con acabados en terracota.', 220.00, 5, 1, 'products/setrusticocampestre'),
('coleccion madera arcilla', 'Perfecta combinación de madera y cerámica para un estilo auténtico.', 290.00, 5, 1, 'products/coleccionmaderaarcilla'),

('set floral encantado', 'Vajilla inspirada en jardines florales con colores vibrantes.', 275.00, 6, 1, 'products/setfloralencantado'),
('coleccion botanica vintage', 'Vajilla con ilustraciones botánicas inspiradas en la naturaleza.', 325.00, 6, 1, 'products/coleccionbotanicavintage');

-- Imágenes de Productos
INSERT INTO product_images (product_id, url,public_id,is_main) VALUES 
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144919/arteclasico3jx3i7t_muzskg.webp','arteclasico3jx3i7t_muzskg',true),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144914/arteclasico1nyyn77_et5uyz.webp','arteclasico1nyyn77_et5uyz',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144895/arteclasico4kldqqn_ngpgkd.webp','arteclasico4kldqqn_ngpgkd',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741143759/ecpgfqdsksveo6adkea5_dfvlt6.webp','ecpgfqdsksveo6adkea5_dfvlt6',false),

(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741143690/jwquj6h4wuqud8zl19a7_drkhx6.webp','jwquj6h4wuqud8zl19a7_drkhx6',true),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144187/Arte_Cla%CC%81sico_5_z2fu7f_plqbpp.webp','Arte_Clásico_5_z2fu7f_plqbpp',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144272/Arte_Clasico_5_xcvbdg_qd62yl.webp','Arte_Clasico_5_xcvbdg_qd62yl',false),

(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145532/bohoChic4fgt9ml_wcqkli.webp','bohoChic4fgt9ml_wcqkli',true),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145524/bohochic6xmbjtd_knwjau.webp','bohochic6xmbjtd_knwjau',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145520/bohochic5auzdkq_cja75m.webp','bohochic5auzdkq_cja75m',false),

(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142708/zrjwcnanmvcahntg6ky6_md9jmk.webp','zrjwcnanmvcahntg6ky6_md9jmk',true),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142710/bkdp54wokfugc4mi93js_aa8r1j.webp','bkdp54wokfugc4mi93js_aa8r1j',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142714/ugby875zwcb5wsq2aiof_sqet0w.webp','ugby875zwcb5wsq2aiof_sqet0w',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142719/vaxjb5w88lovxciacaad_wzsgqx.webp','vaxjb5w88lovxciacaad_wzsgqx',false),

(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145935/Vintage_Elegance_4_gjoxty_m88uqb.webp','Vintage_Elegance_4_gjoxty_m88uqb',true),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145941/Vintage_Elegance_1_xqlqxp_nrx2dg.webp','Vintage_Elegance_1_xqlqxp_nrx2dg',false),

(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145980/Vintage_Elegance_5_iw48ad_m5vpad.webp','Vintage_Elegance_5_iw48ad_m5vpad',true),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741139408/Vintage_Elegance_6_cjluvu_akcy2d.webp','Vintage_Elegance_6_cjluvu_akcy2d',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145993/Vintage_Elegance_2_jpdtrz_rcqpeh.webp','Vintage_Elegance_2_jpdtrz_rcqpeh',false),

(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146342/Modern_Minimal_1_f7wl60_kv3ib1.webp','Modern_Minimal_1_f7wl60_kv3ib1',true),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146375/Modern_Minimal_3_qfhbsx_jy6mwc.webp','Modern_Minimal_3_qfhbsx_jy6mwc',false),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146381/Modern_Minimal_4_zzyheb_ebunye.webp','Modern_Minimal_4_zzyheb_ebunye',false),

(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146432/Modern_Minimal_6_srbtld_kbnupf.webp','Modern_Minimal_6_srbtld_kbnupf',true),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146424/Modern_Minimal_5_iar5wh_sfc5hs.webp','Modern_Minimal_5_iar5wh_sfc5hs',false),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146438/ModernMinimal2tgfkjw_y02clw.webp','ModernMinimal2tgfkjwy02clw',false),

(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147066/RusticLuxe4nnryzre1hcqh.webp','RusticLuxe4nnryzre1hcqh',true),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147060/RusticLuxe3b5vdinbdurzv.webp','RusticLuxe3b5vdinbdurzv',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147072/RusticLuxe1a8undxo5btxb.webp','RusticLuxe1a8undxo5btxb',false),

(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147120/RusticLuxe5fz9mnot391xy.webp','RusticLuxe5fz9mnot391xy',true),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147127/RusticLuxe6dz4junp4mxtq.webp','RusticLuxe6dz4junp4mxtq',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147132/RusticLuxe2tyrjgeizybwh.webp','RusticLuxe2tyrjgeizybwh',false),

(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147789/JardinEnchantee2sg7r0dmozbqo.webp','JardinEnchantee2sg7r0dmozbqo',true),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147783/JardinEnchante5vsd7fzvinlq2.webp','JardinEnchante5vsd7fzvinlq2',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147796/JardinEnchante1qzbpvcplgwtv.webp','JardinEnchante1qzbpvcplgwtv',false),

(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147871/JardinEnchante3kopi5nx0sfo7.webp','JardinEnchante3kopi5nx0sfo7',true),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147865/JardinEnchante6htmswzfjd53k.webp','JardinEnchante6htmswzfjd53k',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147859/JardinEnchante4fvrnafdpm6v1.webp','JardinEnchante4fvrnafdpm6v1',false);

-- Características de Productos
INSERT INTO attributes (is_active, icon, description) VALUES 
(true, 'DinnerDining', 'Ideal para cenas elegantes'),
(true, 'BrunchDining', 'Perfecto para desayunos y brunch'),
(true, 'Flatware', 'Incluye cubiertos y accesorios'),
(true, 'Liquor', 'Diseño ideal para servir bebidas'),
(true, 'FormatPaint', 'Acabado artístico y decorativo'),
(true, 'Palette', 'Colores vibrantes y llamativos'),
(true, 'Pattern', 'Diseño con patrones únicos'),
(true, 'Celebration', 'Especial para eventos y celebraciones'),
(true, 'Festival', 'Inspirado en festivales culturales'),
(true, 'TheaterComedy', 'Diseño dramático y expresivo'),
(true, 'Forest', 'Materiales naturales y ecológicos'),
(true, 'EmojiEvents', 'Premiado por su diseño'),
(true, 'Category', 'Vajilla versátil para múltiples usos'),
(true, 'LocalBar', 'Ideal para bares y cócteles'),
(true, 'LocalCafe', 'Perfecto para café y té'),
(true, 'FoodBank', 'Resistente y funcional'),
(true, 'Restaurant', 'Uso profesional en restaurantes'),
(true, 'SetMeal', 'Conjunto completo de vajilla');

-- Relación Producto - Características
INSERT INTO product_attributes (product_id, attribute_id) VALUES 
(1, 1), (1, 5), (1, 12),  
(2, 1), (2, 4), (2, 17),  
(3, 2), (3, 6), (3, 11),  
(4, 2), (4, 7), (4, 9),   
(5, 1), (5, 4), (5, 18),  
(6, 1), (6, 2), (6, 8),  
(7, 3), (7, 5), (7, 14),  
(8, 3), (8, 7), (8, 16),  
(9, 11), (9, 12), (9, 13),
(10, 11), (10, 15), (10, 17), 
(11, 6), (11, 8), (11, 10),
(12, 6), (12, 7), (12, 9);

-- Roles
INSERT INTO roles (role_name) VALUES 
('ADMIN'),
('USER');

-- Usuarios con relación 1 a 1 con Roles
INSERT INTO users(name, surname, email, password, role_id)VALUES
('maison', 'application', 'cuenta.usuario.proyectos@gmail.com', '$2a$10$AlQdHxYoSrwNDPv8uvym5uPPxiFHdMQhx42lT1X1QNccnqdTO5kRG', 1);


