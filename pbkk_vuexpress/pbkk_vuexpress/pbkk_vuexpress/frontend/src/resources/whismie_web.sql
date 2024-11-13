-- Active: 1717655547271@@127.0.0.1@3306@pbkk_vuexpress

DROP DATABASE IF EXISTS pbkk_vuexpress;
CREATE DATABASE pbkk_vuexpress
    DEFAULT CHARACTER SET = 'utf8mb4';

USE pbkk_vuexpress;

-- not used
CREATE TABLE Pegawai (
    id_pegawai CHAR(5) PRIMARY KEY,
    nama_pegawai VARCHAR(30),
    email_pegawai VARCHAR(30),
    password_pegawai VARCHAR(30),
    status_pegawai INT
) ENGINE=INNODB;

CREATE TABLE Pembeli (
    id_pembeli INT AUTO_INCREMENT PRIMARY KEY,
    nama_pembeli VARCHAR(30),
    email_pembeli VARCHAR(30),
    password_pembeli VARCHAR(30)
) ENGINE=INNODB;

CREATE TABLE Menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nama_menu VARCHAR(50),
    stok_menu INT,
    jenis_menu VARCHAR(10),
    durasi_memasak VARCHAR(8),
    harga_menu DECIMAL(7,2),
    diskon_menu VARCHAR(10), 
    vote_menu VARCHAR(20),
    star_menu VARCHAR(10), 
    status_menu VARCHAR(20),  
    src_menu VARCHAR(100)
) ENGINE=INNODB;

CREATE TABLE Cart (
  cart_id_pembeli INT,
  cart_id_menu INT,
  item_qty INT,
  PRIMARY KEY (cart_id_pembeli, cart_id_menu),
  CONSTRAINT fk_cart_pembeli FOREIGN KEY (cart_id_pembeli) REFERENCES Pembeli(id_pembeli),
  CONSTRAINT fk_cart_menu FOREIGN KEY (cart_id_menu) REFERENCES Menu(id_menu)
) ENGINE=INNODB;

CREATE TABLE Pesanan (
    id_pesanan CHAR(5) PRIMARY KEY,
    waktu_pesanan TIMESTAMP,
    jumlah_menu INT,
    total_harga DECIMAL(7,2),
    catatan_khusus VARCHAR(100),
    status_pesanan INT,
    pembeli_ps_id_pembeli INT,
    FOREIGN KEY (pembeli_ps_id_pembeli) REFERENCES Pembeli(id_pembeli)
) ENGINE=INNODB;

CREATE TABLE Pesanan_Menu (
    pesanan_pm_id_pesanan CHAR(5),
    menu_id_menu INT,
    item_qty INT,
    pegawai_pm_id_pegawai CHAR(5),
    FOREIGN KEY (pesanan_pm_id_pesanan) REFERENCES Pesanan(id_pesanan),
    FOREIGN KEY (menu_id_menu) REFERENCES Menu(id_menu),
    FOREIGN KEY (pegawai_pm_id_pegawai) REFERENCES pegawai(id_pegawai)
) ENGINE=INNODB;

INSERT INTO pegawai (id_pegawai, nama_pegawai, email_pegawai, password_pegawai, status_pegawai) 
VALUES 
('P0001', 'Maria', 'maria@example.com', 'maria123', 1),
('P0002', 'Terry', 'terry@example.com', 'terry456', 1),
('P0003', 'John', 'john@example.com', 'john678', 1),
('P0004', 'Abil', 'abil@example.com', 'abil101', 1),
('P0005', 'Agnes', 'agnes@mail.com', 'agnes123', 1),
('P0006', 'Fidel', 'fidel@mail.com', 'fidel789', 1);

SELECT * FROM pegawai;

INSERT INTO Pembeli (nama_pembeli, email_pembeli, password_pembeli)
VALUES 
('Adi Cahyono', 'adi.cahyono@example.com', 'adicahyono123'),
('Budi Santoso', 'budi.santoso@example.com', 'budisantoso456'),
('Citra Wijaya', 'citra.wijaya@example.com', 'citrawijaya789'),
('Dewi Lestari', 'dewi.lestari@example.com', 'dewilestari123'),
('Eka Putri', 'eka.putri@example.com', 'ekaputri456');

SELECT * FROM Pembeli;
-- Disable foreign key checks to avoid constraint violations
SET FOREIGN_KEY_CHECKS = 0;

-- Truncate all tables to remove data
TRUNCATE TABLE Menu;
INSERT INTO Menu (nama_menu, durasi_memasak, stok_menu, harga_menu, jenis_menu, vote_menu, star_menu, status_menu, diskon_menu, src_menu)
VALUES
('Mie Goyang Level 1 (Cabai 5)', '00:10:00', 20, 30000.00, 'Makanan', '6,4RB terjual', '4.5', 'Rekomendasi', 6000.00, 'food/mie-goyang-level-1.jpg'),
('Udang Keju', '00:05:00', 20, 33750.00, 'Makanan', '2,5RB terjual', '4.5', 'Rekomendasi', 7500.00, 'food/udang-keju.jpg'),
('Mie Manja (Tanpa Cabai)', '00:10:00', 20, 27500.00, 'Makanan', '2,1RB terjual', '4.5', 'Mie Manja', 5500.00, 'food/mie-manja.jpg'),
('Mie Disko Level 1 (Cabai 10)', '00:10:00', 20, 27500.00, 'Makanan', '1,8RB terjual', '4.5', 'Mie Disko', 5500.00, 'food/mie-disko-level-1.jpg'),
('Mie Disko Level 2 (Cabai 20)', '00:10:00', 20, 30000.00, 'Makanan', '512 terjual', '4.5', 'Mie Disko', 6000.00, 'food/mie-disko-level-2.jpg'),
('Mie Disko Level 3 (Cabai 30)', '00:10:00', 20, 30000.00, 'Makanan', '326 terjual', '4.5', 'Mie Disko', 6000.00, 'food/mie-disko-level-3.jpg'),
('Mie Disko Level 4 (Cabai 40)', '00:10:00', 20, 35000.00, 'Makanan', '81 terjual', '4.5', 'Mie Disko', 7000.00, 'food/mie-disko-level-4.jpg'),
('Mie Disko Level 5 (Cabai 50)', '00:10:00', 20, 35000.00, 'Makanan', '61 terjual', '4.5', 'Mie Disko', 7000.00, 'food/mie-disko-level-5.jpg'),
('Mie Goyang Level 2 (Cabai 10)', '00:10:00', 20, 30000.00, 'Makanan', '2,3RB terjual', '4.5', 'Mie Goyang', 6000.00, 'food/mie-goyang-level-2.jpg'),
('Mie Goyang Level 3 (Cabai 10)', '00:10:00', 20, 30000.00, 'Makanan', '1,4RB terjual', '4.5', 'Mie Goyang', 6000.00, 'food/mie-goyang-level-3.jpg'),
('Mie Goyang Cabai 25', '00:10:00', 20, 32500.00, 'Makanan', '231 terjual', '4.5', 'Mie Goyang', 6000.00, 'food/mie-goyang-cabai-35.jpg'),
('Mie Goyang Cabai 35', '00:10:00', 20, 32500.00, 'Makanan', '100 terjual', '4.5', 'Mie Goyang', 6000.00, 'food/mie-goyang-cabai-25.jpg'),
('Rice Bowl Blackpepper', '00:10:00', 20, 39375.00, 'Makanan', '365 terjual', '4.5', 'Rice Bowl', 7500.00, 'food/rice-bowl-blackpepper.jpg'),
('Rice Bowl Teriyaki', '00:10:00', 20, 39375.00, 'Makanan', '504 terjual', '4.5', 'Rice Bowl', 7500.00, 'food/rice-bowl-teriyaki.jpg'),
('Rice Bowl Sweet & Sour', '00:10:00', 20, 39375.00, 'Makanan', '146 terjual', '4.5', 'Rice Bowl', 7500.00, 'food/rice-bowl-sweet-sour.jpg'),
('Rice Bowl Spicy', '00:10:00', 20, 39375.00, 'Makanan', '142 terjual', '4.5', 'Rice Bowl', 7500.00, 'food/rice-bowl-spicy.jpg'),
('Rice Bowl Sambal Matah', '00:10:00', 20, 39375.00, 'Makanan', '346 terjual', '4.5', 'Rice Bowl', 7500.00, 'food/rice-bowl-sambal-matah.jpg'),
('Siomay', '00:10:00', 20, 32500.00, 'Makanan', '1,4RB terjual', '4.5', 'Genk Dimsum', 5500.00, 'food/siomay.jpg'),
('Pangsit Goreng', '00:10:00', 20, 32500.00, 'Makanan', '306 terjual', '4.5', 'Genk Dimsum', 5500.00, 'food/pangsit-goreng.jpg'),
('Bola Udang Keju', '00:10:00', 20, 33750.00, 'Makanan', '1,1RB terjual', '4.5', 'Genk Dimsum', 7500.00, 'food/bola-udang-keju.jpg'),
('Bola Udang Steam', '00:10:00', 20, 33750.00, 'Makanan', '253 terjual', '4.5', 'Genk Dimsum', 7500.00, 'food/bola-udang-steam.jpg'),
('Udang Rambutan', '00:10:00', 20, 33750.00, 'Makanan', '1,3RB terjual', '4.5', 'Genk Dimsum', 7500.00, 'food/udang-rambutan.jpg'),
('Ceker', '00:10:00', 20, 29375.00, 'Makanan', '590 terjual', '4.5', 'Genk Dimsum', 5000.00, 'food/ceker.jpg'),
('Lumpia Ayam', '00:10:00', 20, 29375.00, 'Makanan', '641 terjual', '4.5', 'Genk Dimsum', 5000.00, 'food/lumpia-ayam.jpg'),
('Lumpia Udang', '00:10:00', 20, 32500.00, 'Makanan', '1,2RB terjual', '4.5', 'Genk Dimsum', 5500.00, 'food/lumpia-udang.jpg'),
('Pao Ayam Goreng', '00:10:00', 20, 29375.00, 'Makanan', '169 terjual', '4.5', 'Genk Dimsum', 5000.00, 'food/pao-ayam-goreng.jpg'),
('Pao Ayam Steam', '00:10:00', 20, 29375.00, 'Makanan', '91 terjual', '4.5', 'Genk Dimsum', 5000.00, 'food/pao-ayam-steam.jpg'),
('Sushi', '00:10:00', 20, 32500.00, 'Makanan', '307 terjual', '4.5', 'Genk Dimsum', 5500.00, 'food/sushi.jpg'),
('Chicken Karage', '00:10:00', 20, 39375.00, 'Makanan', '86 terjual', '4.5', 'Genk Sushi', 7500.00, 'food/chicken-karage.jpg'),
('Chicken Katsu', '00:10:00', 20, 39375.00, 'Makanan', '236 terjual', '4.5', 'Genk Sushi', 7500.00, 'food/chicken-katsu.jpg'),
('Classic Roll', '00:10:00', 20, 36250.00, 'Makanan', '340 terjual', '4.5', 'Genk Sushi', 6500.00, 'food/classic-roll.jpg'),
('Electric Roll', '00:10:00', 20, 36250.00, 'Makanan', '155 terjual', '4.5', 'Genk Sushi', 6500.00, 'food/electric-roll.jpg'),
('Hip & Roll', '00:10:00', 20, 36250.00, 'Makanan', '311 terjual', '4.5', 'Genk Sushi', 6500.00, 'food/hip-roll.jpg'),
('Retro Roll', '00:10:00', 20, 36250.00, 'Makanan', '41 terjual', '4.5', 'Genk Sushi', 6500.00, 'food/retro-roll.jpg'),
('Rock N Roll', '00:10:00', 20, 36250.00, 'Makanan', '114 terjual', '4.5', 'Genk Sushi', 6500.00, 'food/rock-n-roll.jpg'),
('Spicy Chicken Wings', '00:10:00', 20, 39375.00, 'Makanan', '685 terjual', '4.5', 'Genk Sushi', 7500.00, 'food/spicy-chicken-wings.jpg'),
('Avocado Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '61 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/avocado-coffee-frappe.jpg'),
('Caramel Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '41 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/caramel-coffee-frappe.jpg'),
('Cookies & Cream Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '98 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/cookies-cream-coffee-frappe.jpg'),
('Hazelnut Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '39 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/hazelnut-coffee-frappe.jpg'),
('Mocca Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '55 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/mocca-coffee-frappe.jpg'),
('Original Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '16 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/original-coffee-frappe.jpg'),
('Vanilla Coffee Frappe', '00:05:00', 20, 38125.00, 'Minuman', '9 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/vanilla-coffee-frappe.jpg'),
('Tiramisu Coffee Frape', '00:05:00', 20, 38125.00, 'Minuman', '25 terjual', '4.5', 'Frappe Coffee Ice', 7500.00, 'drink/tiramisu-coffee-frappe.jpg'),
('Milk Tea', '00:05:00', 20, 26875.00, 'Minuman', '89 terjual', '4.5', 'Frappe Ice', 5250.00, 'drink/milk-tea.jpg'),
('Caramel Frappe', '00:05:00', 20, 32500.00, 'Minuman', '19 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/caramel-frappe.jpg'),
('Green Tea Frappe', '00:05:00', 20, 32500.00, 'Minuman', '113 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/green-tea-frappe.jpg'),
('Ice Chocolate', '00:05:00', 20, 32500.00, 'Minuman', '122 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/ice-chocolate.jpg'),
('Ice Kopi Susu', '00:05:00', 20, 32500.00, 'Minuman', '78 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/ice-kopi-susu.jpg'),
('Matcha Latte Ice', '00:05:00', 20, 32500.00, 'Minuman', '51 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/matcha-latte-ice.jpg'),
('Red Velvet Frappe', '00:05:00', 20, 32500.00, 'Minuman', '58 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/red-velvet-frappe.jpg'),
('Red Velvet Latte Ice', '00:05:00', 20, 32500.00, 'Minuman', '37 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/red-velvet-latte-ice.jpg'),
('Taro Frappe', '00:05:00', 20, 32500.00, 'Minuman', '77 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/taro-frappe.jpg'),
('Taro Latte Ice', '00:05:00', 20, 32500.00, 'Minuman', '29 terjual', '4.5', 'Frappe Ice', 6500.00, 'drink/taro-latte-ice.jpg'),
('Ice Dj', '00:05:00', 20, 33750.00, 'Minuman', '323 terjual', '4.5', 'Ice Bar', 6750.00, 'drink/ice-dj.jpg'),
('Ice Funky', '00:05:00', 20, 28125.00, 'Minuman', '106 terjual', '4.5', 'Ice Bar', 6750.00, 'drink/ice-funky.jpg'),
('Ice Lemon Tea', '00:05:00', 20, 22500.00, 'Minuman', '206 terjual', '4.5', 'Ice Bar', 4500.00, 'drink/ice-lemon-tea.jpg'),
('Ice Reggae', '00:05:00', 20, 31250.00, 'Minuman', '92 terjual', '4.5', 'Ice Bar', 6250.00, 'drink/ice-reggae.jpg'),
('Ice Tea', '00:05:00', 20, 21250.00, 'Minuman', '284 terjual', '4.5', 'Ice Bar', 4250.00, 'drink/ice-tea.jpg'),
('Lemon Splash', '00:05:00', 20, 22500.00, 'Minuman', '104 terjual', '4.5', 'Ice Bar', 4500.00, 'drink/lemon-splash.jpg'),
('Lychee Splash', '00:05:00', 20, 28125.00, 'Minuman', '50 terjual', '4.5', 'Ice Bar', 6750.00, 'drink/lychee-splash.jpg'),
('Lychee Tea', '00:05:00', 20, 28125.00, 'Minuman', '99 terjual', '4.5', 'Ice Bar', 6750.00, 'drink/lychee-tea.jpg'),
('Orange Splash', '00:05:00', 20, 25625.00, 'Minuman', '47 terjual', '4.5', 'Ice Bar', 6250.00, 'drink/orange-splash.jpg'),
('Rosen Rose', '00:05:00', 20, 25625.00, 'Minuman', '24 terjual', '4.5', 'Ice Bar', 6250.00, 'drink/rosen-rose.jpg'),
('Ice Lemon Tea Jumbo', '00:05:00', 20, 31250.00, 'Minuman', '55 terjual', '4.5', 'Ice Bar', 6250.00, 'drink/ice-lemon-tea-jumbo.jpg'),
('Ice Tea Jumbo', '00:05:00', 20, 26875.00, 'Minuman', '113 terjual', '4.5', 'Ice Bar', 5250.00, 'drink/ice-tea-jumbo.jpg'),
('Lemon Splash Jumbo', '00:05:00', 20, 31250.00, 'Minuman', '22 terjual', '4.5', 'Ice Bar', 6250.00, 'drink/lemon-splash-jumbo.jpg');
SELECT * FROM Menu;

INSERT INTO Pesanan (id_pesanan, waktu_pesanan, pembeli_ps_id_pembeli) 
VALUES 
('1', '2022-05-01 12:00:00', 1),
('2', '2022-05-02 12:00:00', 2),
('3', '2022-05-03 12:00:00', 3),
('4', '2022-05-04 12:00:00', 4);

SELECT * FROM Pesanan;

INSERT INTO Pesanan_Menu (pesanan_pm_id_pesanan, menu_id_menu)
VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('2', '4'),
('2', '5'),
('2', '6'),
('3', '7'),
('4', '8');

SELECT * FROM Pesanan_Menu;

-- FUNCTION
DROP FUNCTION IF EXISTS CountTotalItem;
DROP FUNCTION IF EXISTS SplitString;
DROP FUNCTION IF EXISTS CalculateTotalPrice;

-- CountTotalItem
DELIMITER //

CREATE FUNCTION CountTotalItem(cart_id_pembeli INT)
RETURNS INT
BEGIN
    DECLARE total_item INT;
    SELECT SUM(item_qty)
    INTO total_item
    FROM Cart
    WHERE cart_id_pembeli = cart_id_pembeli;
    RETURN total_item;
END //

DELIMITER ;

-- SplitString
DELIMITER //

CREATE FUNCTION SplitString(
    str VARCHAR(255),
    delim VARCHAR(12),
    pos INT
)
RETURNS VARCHAR(255)
BEGIN
    RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos),
           LENGTH(SUBSTRING_INDEX(str, delim, pos - 1)) + 1),
           delim, '');
END //

DELIMITER ;

-- Drop any existing functions and procedures
DROP FUNCTION IF EXISTS CalculateTotalPrice;
DROP PROCEDURE IF EXISTS UpdateStokMenu;
DROP PROCEDURE IF EXISTS UpdateOrderStatus;
DROP PROCEDURE IF EXISTS UpdateStatusPesanan;
DROP PROCEDURE IF EXISTS UpdateStatusPesanan;

-- Create CalculateTotalPrice function
DELIMITER //

CREATE FUNCTION CalculateTotalPrice(
    jumlah INT,
    harga DECIMAL(7,2)
)
RETURNS DECIMAL(7,2)
BEGIN
    DECLARE total DECIMAL(7,2);
    SET total = jumlah * harga;
    RETURN total;
END //

DELIMITER ;

-- Create UpdateStokMenu procedure
DELIMITER //

CREATE PROCEDURE UpdateStokMenu(
    IN menu_id CHAR(5),
    IN jumlah INT
)
BEGIN
    UPDATE Menu
    SET stok_menu = stok_menu - jumlah
    WHERE id_menu = menu_id;
END //

DELIMITER ;

-- Call the procedure (this can be moved to your application logic)
CALL UpdateStokMenu('1', 2);

-- Create AddToCart procedure
DELIMITER //

CREATE PROCEDURE AddToCart(
    IN pembeli_id INT,
    IN menu_id INT,
    IN quantity INT
)
BEGIN
    DECLARE existing_qty INT;
    SELECT item_qty INTO existing_qty
    FROM Cart
    WHERE cart_id_pembeli = pembeli_id AND cart_id_menu = menu_id;

    IF existing_qty IS NOT NULL THEN
        UPDATE Cart
        SET item_qty = item_qty + quantity
        WHERE cart_id_pembeli = pembeli_id AND cart_id_menu = menu_id;
    ELSE
        INSERT INTO Cart (cart_id_pembeli, cart_id_menu, item_qty)
        VALUES (pembeli_id, menu_id, quantity);
    END IF;
END //

DELIMITER ;

-- Call AddToCart procedure (this can be moved to your application logic)
CALL AddToCart(1, 3, 2);

-- Create UpdateStatusPesanan procedure
DELIMITER //

CREATE PROCEDURE UpdateStatusPesanan(IN p_id_pesanan INT)
BEGIN
    UPDATE Pesanan
    SET status_pesanan = status_pesanan + 1
    WHERE id_pesanan = p_id_pesanan;
END //

DELIMITER ;

-- Call UpdateStatusPesanan procedure (this can be moved to your application logic)
CALL UpdateStatusPesanan(1);

-- Drop existing triggers
DROP TRIGGER IF EXISTS AfterInsertPesananMenu;

-- Create AfterInsertPesananMenu trigger
DELIMITER //

CREATE TRIGGER AfterInsertPesananMenu
AFTER INSERT ON Pesanan_Menu
FOR EACH ROW
BEGIN
    CALL UpdateStokMenu(NEW.menu_id_menu, NEW.item_qty);
END //

DELIMITER ;

-- Show existing triggers for verification
SHOW TRIGGERS FROM pbkk_vuexpress;

-- Show indexes
SHOW INDEXES FROM pegawai;
SHOW INDEXES FROM Pembeli;
SHOW INDEXES FROM Menu;
SHOW INDEXES FROM Cart;
SHOW INDEXES FROM Pesanan;
SHOW INDEXES FROM Pesanan_Menu;

-- Create indexes
CREATE INDEX idx_nama_pegawai ON pegawai(nama_pegawai);
CREATE INDEX idx_nama_pembeli ON Pembeli(nama_pembeli);
CREATE INDEX idx_nama_menu ON Menu(nama_menu);
CREATE INDEX idx_harga_menu ON Menu(harga_menu);
CREATE INDEX idx_status_menu ON Menu(status_menu);
CREATE INDEX idx_jenis_menu ON Menu(jenis_menu);

-- Create views
CREATE VIEW PesananDetail AS
SELECT 
    p.id_pesanan AS ID_Pesanan,
    pb.nama_pembeli AS Nama_Pembeli,
    pm.nama_menu AS Nama_Menu,
    psn.item_qty AS Jumlah_Item,
    pj.nama_pegawai AS Nama_pegawai,
    p.waktu_pesanan AS Waktu_Pesanan,
    p.total_harga AS Total_Harga,
    p.status_pesanan AS Status_Pesanan
FROM
    Pesanan p
    JOIN Pembeli pb ON p.pembeli_ps_id_pembeli = pb.id_pembeli
    JOIN Pesanan_Menu psn ON p.id_pesanan = psn.pesanan_pm_id_pesanan
    JOIN Menu pm ON psn.menu_id_menu = pm.id_menu
    JOIN pegawai pj ON psn.pegawai_pm_id_pegawai = pj.id_pegawai;

SELECT * FROM PesananDetail WHERE ID_Pesanan = 'PS001';

CREATE VIEW MenuDiskon AS
SELECT 
    m.id_menu AS ID_Menu,
    m.nama_menu AS Nama_Menu,
    m.harga_menu AS Harga_Menu,
    m.diskon_menu AS Diskon_Menu,
    m.status_menu AS Status_Menu
FROM
    Menu m
WHERE
    m.diskon_menu > 0;

SELECT * FROM MenuDiskon;