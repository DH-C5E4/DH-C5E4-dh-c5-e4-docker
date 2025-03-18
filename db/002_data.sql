-- Roles
INSERT INTO roles (role_name) VALUES 
('ADMIN'),
('USER');

-- Usuarios con relación 1 a 1 con Roles
INSERT INTO users(name, surname, email, password, role_id,is_active)VALUES
('maison', 'application', 'cuenta.usuario.proyectos@gmail.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 1,true),
('Laura', 'González', 'laura.gonzalez@gmail.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2,true),
('Carlos', 'Méndez', 'carlos.mendez@gmail.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2,true),
('Sofía', 'Ramírez', 'sofia.ramirez@gmail.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2,true),
('Javier', 'Fernández', 'javier.fernandez@gmail.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2,true),
('María', 'López', 'maria.lopez@gmail.com', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 2,true);

-- Categorías                       
INSERT INTO categories (is_active, title, description, cloudinary_folder,public_id,image) VALUES 
(true,'LArtClassique', 'Categoría de vajilla con diseños clásicos y elegantes','categories/LArtClassique','categories/LArtClassique/gcbofmixmbuqqma0hyon', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740962641/categories/LArtClassique/gcbofmixmbuqqma0hyon.webp'),

(true,'BohoChi', 'Estilo bohemio con patrones naturales y coloridos','categories/BohoChi','categories/BohoChi/ulfklzinfidlypecimpr', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740963062/categories/BohoChi/ulfklzinfidlypecimpr.webp'),

(true,'VintageElegance', 'Diseños vintage con toques elegantes','categories/VintageElegance','categories/VintageElegance/aitm5vz5xh78vhd9ksea', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740963496/categories/VintageElegance/aitm5vz5xh78vhd9ksea.webp'),

(true,'ModernMinimal', 'Estilo moderno con diseños limpios y minimalistas','categories/ModernMinimal','categories/ModernMinimal/dttiq231ilx5wjtml1rb', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740964090/categories/ModernMinimal/dttiq231ilx5wjtml1rb.webp'),

(true,'RusticLuxe', 'Combinación de lujo con elementos rústicos','categories/RusticLuxe/','categories/RusticLuxe/bsn4y3jjpewpluxy1val', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740964318/categories/RusticLuxe/bsn4y3jjpewpluxy1val.webp'),

(true,'JardinEnchanté', 'Inspiración en la naturaleza y jardines','categories/JardinEnchant%C3%A9','categories/JardinEnchant%C3%A9/sywsuihx6xdrsnoq1hfq', 'https://res.cloudinary.com/duxlduuy2/image/upload/v1740964333/categories/JardinEnchant%C3%A9/sywsuihx6xdrsnoq1hfq.webp');

-- Estado de Productos
INSERT INTO product_status (description) VALUES 
('Active'),
('Inactive');

INSERT INTO event_address (street, city, state, postal_code) 
VALUES ('Av. Siempre Viva 742', 'Springfield', 'SP', '12345'),
('Calle 123', 'Madrid', 'MD', '28001'),
('Avenida Reforma 456', 'Ciudad de México', 'CDMX', '11000'),
('Rua das Flores 78', 'São Paulo', 'SP', '04567-890'),
('Boulevard Saint-Michel 32', 'París', 'IDF', '75005'),
('Main Street 88', 'Los Ángeles', 'CA', '90012');

-- Productos
INSERT INTO products (name, description, category_id, product_status_id, cloudinary_folder, price, quantity) VALUES 
('sét impérial dorado', 'Elegante juego de vajilla con detalles dorados y diseño barroco.', 1, 1, 'products/setimperialdorado',350.0,1),
('coleccion real azúl', 'Vajilla con tonos azul profundo y bordes dorados para cenas sofisticadas.', 1, 1, 'products/coleccionrealazul',420.0,1),

('set náturalezá boho', 'Vajilla con diseños florales en tonos tierra, perfecta para ambientes relajados.',  2, 1,'products/setnaturalezaboho',280.0,1),
('vajilla etnica órganica', 'Inspirada en patrones étnicos con un toque moderno.',  2, 1, 'products/vajillaetnicaorganica',195.0,1),

('set perla azúl', 'Delicada vajilla en tonos azul perla con bordes plateados.',  3, 1, 'products/setperlaazul',510.0,1),
('vajílla dorado majestuoso', 'Conjunto de platos con detalles dorados y cristalería elegante.',  3, 1, 'products/vajilladoradomajestuoso',255.0,1),

('set blanco puro', 'Vajilla monocromática con líneas modernas y minimalistas.',  4, 1, 'products/setblancopuro',220.0,1),
('vajilla negra contemporanea', 'Diseño moderno en color negro mate con detalles dorados.',  4, 1, 'products/vajillanegracontemporanea',280.0,1),

('set rustico campestre', 'Vajilla inspirada en la naturaleza con acabados en terracota.',  5, 1, 'products/setrusticocampestre',245.0,1),
('coleccion madera arcilla', 'Perfecta combinación de madera y cerámica para un estilo auténtico.',  5, 1, 'products/coleccionmaderaarcilla',156.0,1),

('set floral encantado', 'Vajilla inspirada en jardines florales con colores vibrantes.', 6, 1, 'products/setfloralencantado',405.0,1),
('coleccion botanica vintage', 'Vajilla con ilustraciones botánicas inspiradas en la naturaleza.', 6, 1, 'products/coleccionbotanicavintage',233.0,1);

INSERT INTO booking_status (status) 
VALUES ('CREATED'),
('PENDING'),
('CONFIRMED'),
('COMPLETED'),
('CANCELLED');
                
INSERT INTO bookings (user_id, booking_status_id, event_address_id, event_name, booking_date, number_guests, delivery_schedule, collection_schedule,created_at, email_sent, product_id) 
VALUES (2, 1, 1, 'Boda de Ana y Luis', '2025-03-14', 50, '2025-03-15 10:00:00', '2025-03-16 12:00:00','2025-03-16 12:00:00',true, 1),
(2, 2, 2, 'Fiesta de Aniversario', '2025-04-09', 30, '2025-04-10 15:00:00', '2025-04-11 12:00:00','2025-03-16 12:00:00',true, 3),
(3, 4, 3, 'Reunión Corporativa', '2025-04-04', 100, '2025-04-05 08:00:00', '2025-04-06 20:00:00','2025-03-16 12:00:00',true, 5),
(4, 3, 4, 'Cumpleaños Infantil', '2025-03-19', 20, '2025-03-20 14:00:00', '2025-03-22 18:00:00','2025-03-16 12:00:00',true, 8),
(5, 4, 5, 'Cena Romántica', '2025-03-13', 2, '2025-03-14 19:00:00', '2025-07-15 23:00:00','2025-03-16 12:00:00',true, 2),
(6, 5, 6, 'Fiesta de Graduación', '2025-05-28', 50, '2025-05-29 16:00:00', '2025-05-30 10:00:00', '2025-03-16 12:00:00',true, 1);

-- Imágenes de Productos
INSERT INTO product_images (product_id, url,public_id,is_main) VALUES 
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144919/arteclasico3jx3i7t_muzskg.webp','arteclasico3jx3i7t_muzskg',true),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144914/arteclasico1nyyn77_et5uyz.webp','arteclasico1nyyn77_et5uyz',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144895/arteclasico4kldqqn_ngpgkd.webp','arteclasico4kldqqn_ngpgkd',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741143759/ecpgfqdsksveo6adkea5_dfvlt6.webp','ecpgfqdsksveo6adkea5_dfvlt6',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742013694/set_imperial_dorado_gc2x15.webp','set_imperial_dorado_gc2x15',false),

(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742014534/Arte_Clasico_5_xcvbdg_qd62yl_flkthg.webp','Arte_Clasico_5_xcvbdg_qd62yl_flkthg',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742015354/jwquj6h4wuqud8zl19a7_drkhx6_asvbgs.webp','jwquj6h4wuqud8zl19a7_drkhx6_asvbgs',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742015360/arteclaasico5z2fu7fplqbpp_t0dvpg.webp','arteclaasico5z2fu7fplqbpp_t0dvpg',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742014287/coleccion_real_azul_1_glokzz.webp','coleccion_real_azul_1_glokzz',false),
(1, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742014287/coleccion_real_azul_2_bss1gt.webp','coleccion_real_azul_2_bss1gt',false),


(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741143690/jwquj6h4wuqud8zl19a7_drkhx6.webp','jwquj6h4wuqud8zl19a7_drkhx6',true),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144187/Arte_Cla%CC%81sico_5_z2fu7f_plqbpp.webp','Arte_Clásico_5_z2fu7f_plqbpp',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741144272/Arte_Clasico_5_xcvbdg_qd62yl.webp','Arte_Clasico_5_xcvbdg_qd62yl',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742015845/coleccion_real_azul_2_yfnabi.webp','coleccion_real_azul_2_yfnabi',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742015845/coleccion_real_azul_1_qkyuq8.webp','coleccion_real_azul_1_qkyuq8',false),

(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742016024/ecpgfqdsksveo6adkea5_dfvlt6_mfmyoa.webp','ecpgfqdsksveo6adkea5_dfvlt6_mfmyoa',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742016027/set_imperial_dorado_gc2x15_gyqtsj.webp','set_imperial_dorado_gc2x15_gyqtsj',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742016033/arteclasico3jx3i7t_muzskg_qntwhj.webp','arteclasico3jx3i7t_muzskg_qntwhj',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742016030/arteclasico1nyyn77_et5uyz_zdpblf.webp','arteclasico1nyyn77_et5uyz_zdpblf',false),
(2, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742016037/arteclasico4kldqqn_ngpgkd_tugagd.webp','arteclasico4kldqqn_ngpgkd_tugagd',false),


(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145532/bohoChic4fgt9ml_wcqkli.webp','bohoChic4fgt9ml_wcqkli',true),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145524/bohochic6xmbjtd_knwjau.webp','bohochic6xmbjtd_knwjau',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145520/bohochic5auzdkq_cja75m.webp','bohochic5auzdkq_cja75m',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017083/set_naturaleza_boho_2_msbs7k.webp','set_naturaleza_boho_2_msbs7k',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017086/set_naturaleza_boho_1_lqwnfr.webp','set_naturaleza_boho_1_lqwnfr',false),

(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017874/bkdp54wokfugc4mi93js_aa8r1j_a3mrem.webp','bkdp54wokfugc4mi93js_aa8r1j_a3mrem',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017878/zrjwcnanmvcahntg6ky6_md9jmk_bn3udt.webp','zrjwcnanmvcahntg6ky6_md9jmk_bn3udt',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017882/ugby875zwcb5wsq2aiof_sqet0w_knsvzg.webp','ugby875zwcb5wsq2aiof_sqet0w_knsvzg',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017887/Vajilla_etnia_organica_1_s64hnz_rwh8ds.webp','Vajilla_etnia_organica_1_s64hnz_rwh8ds',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017893/Vajilla_etnia_organica_2_azz45k_l0figf.webp','Vajilla_etnia_organica_2_azz45k_l0figf',false),
(3, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017899/vaxjb5w88lovxciacaad_wzsgqx_vppvxq.webp','vaxjb5w88lovxciacaad_wzsgqx_vppvxq',false),

(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142708/zrjwcnanmvcahntg6ky6_md9jmk.webp','zrjwcnanmvcahntg6ky6_md9jmk',true),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142710/bkdp54wokfugc4mi93js_aa8r1j.webp','bkdp54wokfugc4mi93js_aa8r1j',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142714/ugby875zwcb5wsq2aiof_sqet0w.webp','ugby875zwcb5wsq2aiof_sqet0w',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741142719/vaxjb5w88lovxciacaad_wzsgqx.webp','vaxjb5w88lovxciacaad_wzsgqx',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017285/Vajilla_etnia_organica_1_s64hnz.webp','Vajilla_etnia_organica_1_s64hnz',false),

(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017289/Vajilla_etnia_organica_2_azz45k.webp','Vajilla_etnia_organica_2_azz45k',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017471/set_naturaleza_boho_2_msbs7k_sknrrn.webp','set_naturaleza_boho_2_msbs7k_sknrrn',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017475/set_naturaleza_boho_1_lqwnfr_mqadws.webp','set_naturaleza_boho_1_lqwnfr_mqadws',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017478/bohoChic4fgt9ml_wcqkli_eddopl.webp','bohoChic4fgt9ml_wcqkli_eddopl',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017484/bohochic5auzdkq_cja75m_jmyeqq.webp','bohochic5auzdkq_cja75m_jmyeqq',false),
(4, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742017516/bohochic6xmbjtd_knwjau_orx1yz.webp','bohochic6xmbjtd_knwjau_orx1yz',false),

(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145935/Vintage_Elegance_4_gjoxty_m88uqb.webp','Vintage_Elegance_4_gjoxty_m88uqb',true),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145941/Vintage_Elegance_1_xqlqxp_nrx2dg.webp','Vintage_Elegance_1_xqlqxp_nrx2dg',false),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018288/set_perla_azul_2_hkhyhk.webp','set_perla_azul_2_hkhyhk',false),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018290/set_perla_azul_1_uckq9q.webp','set_perla_azul_1_uckq9q',false),

(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019176/Vintage_Elegance_2_jpdtrz_rcqpeh_h7xigo.webp','Vintage_Elegance_2_jpdtrz_rcqpeh_h7xigo',false),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019173/dorado_majestuoso_2_f8e6b0_x2oj8s.webp','dorado_majestuoso_2_f8e6b0_x2oj8s',false),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019169/dorado_majestuoso_1_mkjzsg_eqwysl.webp','dorado_majestuoso_1_mkjzsg_eqwysl',false),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019166/Vintage_Elegance_6_cjluvu_akcy2d_kktnak.webp','Vintage_Elegance_6_cjluvu_akcy2d_kktnak',false),
(5, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019163/Vintage_Elegance_5_iw48ad_m5vpad_ty6kx5.webp','Vintage_Elegance_5_iw48ad_m5vpad_ty6kx5',false),

(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145980/Vintage_Elegance_5_iw48ad_m5vpad.webp','Vintage_Elegance_5_iw48ad_m5vpad',true),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741139408/Vintage_Elegance_6_cjluvu_akcy2d.webp','Vintage_Elegance_6_cjluvu_akcy2d',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741145993/Vintage_Elegance_2_jpdtrz_rcqpeh.webp','Vintage_Elegance_2_jpdtrz_rcqpeh',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018544/dorado_majestuoso_1_mkjzsg.webp','dorado_majestuoso_1_mkjzsg',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018547/dorado_majestuoso_2_f8e6b0.webp','dorado_majestuoso_2_f8e6b0',false),

(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018667/Vintage_Elegance_4_gjoxty_m88uqb_qlmlpl.webp','Vintage_Elegance_4_gjoxty_m88uqb_qlmlpl',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018870/Vintage_Elegance_1_xqlqxp_nrx2dg_cky5oj.webp','Vintage_Elegance_1_xqlqxp_nrx2dg_cky5oj',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018873/set_perla_azul_1_uckq9q_q2lfif.webp','set_perla_azul_1_uckq9q_q2lfif',false),
(6, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742018867/set_perla_azul_2_hkhyhk_fpc8rv.webp','set_perla_azul_2_hkhyhk_fpc8rv',false),

(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146342/Modern_Minimal_1_f7wl60_kv3ib1.webp','Modern_Minimal_1_f7wl60_kv3ib1',true),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146375/Modern_Minimal_3_qfhbsx_jy6mwc.webp','Modern_Minimal_3_qfhbsx_jy6mwc',false),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146381/Modern_Minimal_4_zzyheb_ebunye.webp','Modern_Minimal_4_zzyheb_ebunye',false),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019844/set_blanco_puro_2_wp7xpu.webp','set_blanco_puro_2_wp7xpu',false),
(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019846/set_blanco_puro_1_xvnyba.webp','set_blanco_puro_1_xvnyba',false),

(7, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742019995/Modern_Minimal_5_iar5wh_sfc5hs_zkumte.webp','Modern_Minimal_5_iar5wh_sfc5hs_zkumte',false),

(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146432/Modern_Minimal_6_srbtld_kbnupf.webp','Modern_Minimal_6_srbtld_kbnupf',true),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146424/Modern_Minimal_5_iar5wh_sfc5hs.webp','Modern_Minimal_5_iar5wh_sfc5hs',false),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741146438/ModernMinimal2tgfkjw_y02clw.webp','ModernMinimal2tgfkjwy02clw',false),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742020225/negra_contemporanea_1_jxlz2x.webp','negra_contemporanea_1_jxlz2x',false),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742020229/negra_contemporanea_2_s1iyna.webp','negra_contemporanea_2_s1iyna',false),

(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742020306/Modern_Minimal_3_qfhbsx_jy6mwc_nlet8f.webp','Modern_Minimal_3_qfhbsx_jy6mwc_nlet8f',false),
(8, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742020310/Modern_Minimal_1_f7wl60_kv3ib1_f63tio.webp','Modern_Minimal_1_f7wl60_kv3ib1_f63tio',false),

(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147066/RusticLuxe4nnryzre1hcqh.webp','RusticLuxe4nnryzre1hcqh',true),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147060/RusticLuxe3b5vdinbdurzv.webp','RusticLuxe3b5vdinbdurzv',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147072/RusticLuxe1a8undxo5btxb.webp','RusticLuxe1a8undxo5btxb',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742022897/Set_rustico_campestre_1_dxjui0.webp','Set_rustico_campestre_1_dxjui0',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742022900/Set_rustico_campestre_2_unuesc.webp','Set_rustico_campestre_2_unuesc',false),

(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024179/RusticLuxe6dz4jun_p4mxtq_q9jq17.webp','RusticLuxe6dz4jun_p4mxtq_q9jq17',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024183/Coleccion_madera_arcilla_1_j28rog_atpxpf.webp','Coleccion_madera_arcilla_1_j28rog_atpxpf',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024187/Coleccion_madera_arcilla_2_uy09gz_e2bjjw.webp','Coleccion_madera_arcilla_2_uy09gz_e2bjjw',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024191/RusticLuxe2tyrjge_izybwh_wr3gjx.webp','RusticLuxe2tyrjge_izybwh_wr3gjx',false),
(9, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024175/RusticLuxe5fz9mno_t391xy_oebzz4.webp','RusticLuxe5fz9mno_t391xy_oebzz4',false),

(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147120/RusticLuxe5fz9mnot391xy.webp','RusticLuxe5fz9mnot391xy',true),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147127/RusticLuxe6dz4junp4mxtq.webp','RusticLuxe6dz4junp4mxtq',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147132/RusticLuxe2tyrjgeizybwh.webp','RusticLuxe2tyrjgeizybwh',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023147/Coleccion_madera_arcilla_1_j28rog.webp','Coleccion_madera_arcilla_1_j28rog',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023151/Coleccion_madera_arcilla_2_uy09gz.webp','Coleccion_madera_arcilla_2_uy09gz',false),

(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023506/Set_rustico_campestre_2_unuesc_nz4qcc.webp','Set_rustico_campestre_2_unuesc_nz4qcc',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023509/Set_rustico_campestre_1_dxjui0_n8qse9.webp','Set_rustico_campestre_1_dxjui0_n8qse9',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023514/RusticLuxe1a8undx_o5btxb_wljldg.webp','RusticLuxe1a8undx_o5btxb_wljldg',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023518/RusticLuxe3b5vdin_bdurzv_ydyb1s.webp','RusticLuxe3b5vdin_bdurzv_ydyb1s',false),
(10, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742023522/RusticLuxe4nnryzr_e1hcqh_z82rmo.webp','RusticLuxe4nnryzr_e1hcqh_z82rmo',false),

(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147789/JardinEnchantee2sg7r0dmozbqo.webp','JardinEnchantee2sg7r0dmozbqo',true),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147783/JardinEnchante5vsd7fzvinlq2.webp','JardinEnchante5vsd7fzvinlq2',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147796/JardinEnchante1qzbpvcplgwtv.webp','JardinEnchante1qzbpvcplgwtv',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024665/set_floral_encantado_1_mrbqav.webp','set_floral_encantado_1_mrbqav',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024668/set_floral_encantado_2_zbxny6.webp','set_floral_encantado_2_zbxny6',false),

(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025672/coleccion_botanica_vintage_2_r1syof_ppxnmz.webp','coleccion_botanica_vintage_2_r1syof_ppxnmz',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025677/hhhneaowzjzfvb6noixm_gmnrho.webp','hhhneaowzjzfvb6noixm_gmnrho',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025684/JardinEnchante3kopi5n_x0sfo7_y6pm1f.webp','JardinEnchante3kopi5n_x0sfo7_y6pm1f',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025686/JardinEnchante6htmswz_fjd53k_xtvlch.webp','JardinEnchante6htmswz_fjd53k_xtvlch',false),
(11, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025691/coleccion_botanica_vintage_1_sdeaeu_wgpaur.webp','coleccion_botanica_vintage_1_sdeaeu_wgpaur',false),

(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147871/JardinEnchante3kopi5nx0sfo7.webp','JardinEnchante3kopi5nx0sfo7',true),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741147865/JardinEnchante6htmswzfjd53k.webp','JardinEnchante6htmswzfjd53k',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1741153984/JardinEnchante4fvrnafdpm6v1.webp','JardinEnchante4fvrnafdpm6v1',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024867/coleccion_botanica_vintage_2_r1syof.webp','coleccion_botanica_vintage_2_r1syof',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742024871/coleccion_botanica_vintage_1_sdeaeu.webp','coleccion_botanica_vintage_1_sdeaeu',false),

(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025046/JardinEnchante5vsd7fz_vinlq2_oalfjo.webp','JardinEnchante5vsd7fz_vinlq2_oalfjo',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025051/JardinEnchantee2sg7r0d_mozbqo_khtrlc.webp','JardinEnchantee2sg7r0d_mozbqo_khtrlc',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025055/set_floral_encantado_1_mrbqav_kbyher.webp','set_floral_encantado_1_mrbqav_kbyher',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025060/set_floral_encantado_2_zbxny6_ccp8iq.webp','set_floral_encantado_2_zbxny6_ccp8iq',false),
(12, 'https://res.cloudinary.com/duxlduuy2/image/upload/v1742025067/JardinEnchante1qzbpvc_plgwtv_pwone3.webp','JardinEnchante1qzbpvc_plgwtv_pwone3',false);

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

INSERT INTO favorites(user_id,product_id)
VALUES (2,8),(3,4),(4,6),(5,7),(6,1),(2,12);
 
INSERT INTO customer_review (user_id, booking_id, rating, title, review, created_at) 
VALUES (2,1,4, 'Excelente calidad', 'Excelente calidad y presentación.', '2025-05-16 12:00:00'),
(2, 2, 5, 'Hermosa y elegante','La vajilla era hermosa y elegante, hizo que la cena fuera especial.', '2025-05-16 12:00:00'),
(3, 3, 2, 'Entrega tardía', 'Buena calidad, pero la entrega fue un poco tardía.', '2025-05-16 12:00:00'),
(4, 4, 3, 'Diseño llamativo', 'Los platos estaban bien, un diseño muy llamativo.', '2025-05-16 12:00:00'),
(5, 5, 5, 'Servicio increíble', 'Increíble servicio, todo llegó a tiempo y en perfecto estado.', '2025-05-16 12:00:00'),
(6, 6, 2, 'Material mejorable', 'No me gustó mucho el material de los cubiertos.', '2025-05-16 12:00:00');
