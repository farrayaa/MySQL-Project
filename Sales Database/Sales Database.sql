create database struk;
use struk;

#TABEL Pemasok
-- Membuat Tabel Pemasok
CREATE TABLE Tabel_Pemasok (
    ID_Pemasok VARCHAR(2) PRIMARY KEY,
    Nama_Pemasok VARCHAR(100) NOT NULL,
    Alamat VARCHAR(255) NOT NULL,
    Kota_Asal VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telepon VARCHAR(20) NOT NULL
);
DESC Tabel_Pemasok;

-- Isian pada Tabel Pemasok
INSERT INTO Tabel_Pemasok (ID_Pemasok, Nama_Pemasok, Alamat, Kota_Asal, Email, Telepon)
VALUES
('TD', 'Tech_Data', 'Jl. Wiyung No.12', 'Surabaya', 'infoid@techdata.com', '081954389618'),
('EG', 'Electrolux_Group', 'Jl. Benowo No.19A', 'Mojokerto', 'contact@egroup.com', '082736827455'),
('CC', 'Carrier_Corporation', 'Jl. Bulak No.14G', 'Sidoarjo', 'moreinfo@cc.com', '081783658162'),
('SE', 'Sekai_Electric', 'Jl. Gubeng No.23', 'Surabaya', 'order@sekai.com', '081238729814');
SELECT*FROM Tabel_Pemasok;

#TABEL PETUGAS
-- Membuat Tabel Petugas
CREATE TABLE Tabel_Petugas (
    ID_Petugas VARCHAR(6) PRIMARY KEY,
    Nama_Petugas VARCHAR(50) NOT NULL,
    Alamat VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telepon VARCHAR(15) NOT NULL
);
DESC Tabel_Petugas;

-- Isian pada Tabel Petugas
INSERT INTO Tabel_Petugas (ID_Petugas, Nama_Petugas, Alamat, Email, Telepon)
VALUES
('PAD020', 'Putri', 'Jl. Genteng No.20', 'pad@gmail.com', '081673982345'),
('EAY030', 'Ersa', 'Jl. Mulyorejo No.30', 'ersa@gmail.com', '081217038612'),
('APT120', 'Asti', 'Jl. Semolowaru No.120', 'asti@gmail.com', '081569247524');
SELECT*FROM Tabel_Petugas;

#TABEL Merk
-- Membuat Tabel Merk
CREATE TABLE Tabel_Merk (
    Kode_Merk VARCHAR(3) PRIMARY KEY,
    Nama_Merk VARCHAR(50) NOT NULL
);
DESC Tabel_Merk;

-- Isian pada Tabel Merk
INSERT INTO Tabel_Merk (Kode_Merk, Nama_Merk)
VALUES
('SHP', 'Sharp'),
('PNS', 'Panasonic'),
('SMG', 'Samsung'),
('CSM', 'Cosmos'),
('PHL', 'Phillips'),
('MYK', 'Miyako');
SELECT*FROM Tabel_Merk;

#TABEL MEMBER
-- Membuat Tabel Member
CREATE TABLE Tabel_Member (
    ID_Member VARCHAR(3) NOT NULL,
    Keterangan_Member VARCHAR(50) NOT NULL,
    Diskon DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (ID_Member, Diskon)
);
DESC Tabel_Member;

-- Isian pada Tabel Member
INSERT INTO Tabel_Member (ID_Member, Keterangan_Member, Diskon)
VALUES
('SLV', 'Silver', 0.02),
('GLD', 'Gold', 0.03),
('PLT', 'Platinum', 0.05),
('NO', 'No Member', 0.00);
SELECT*FROM Tabel_Member;

#TABEL BARANG MASUK
-- Membuat Tabel Barang Masuk
CREATE TABLE Tabel_Barang_Masuk (
    No_Nota INT PRIMARY KEY,
    Tgl_Masuk DATE,
    ID_Pemasok VARCHAR(2),
    ID_Petugas VARCHAR(6),
    Total DECIMAL(12, 2),
    CONSTRAINT fk_BarangMasuk_Pemasok
        FOREIGN KEY (ID_Pemasok) REFERENCES Tabel_Pemasok(ID_Pemasok)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_BarangMasuk_Petugas
        FOREIGN KEY (ID_Petugas) REFERENCES Tabel_Petugas(ID_Petugas)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
DESC Tabel_Barang_Masuk;

-- Isian pada Tabel Barang Masuk
INSERT INTO Tabel_Barang_Masuk (No_Nota, Tgl_Masuk, ID_Pemasok, ID_Petugas, Total)
VALUES
(1050, '2023-11-19', 'TD', 'EAY030', 20000000),
(1589, '2023-11-20', 'TD', 'EAY030', 4500000),
(1290, '2023-11-23', 'EG', 'APT120', 27600000),
(1739, '2023-11-15', 'CC', 'EAY030', 400000),
(1338, '2023-11-10', 'SE', 'PAD020', 4800000),
(1473, '2023-11-18', 'SE', 'APT120', 600000),
(1329, '2023-11-11', 'TD', 'PAD020', 20000000),
(1967, '2023-11-12', 'SE', 'PAD020', 2400000);
SELECT*FROM Tabel_Barang_Masuk;

#TABEL BARANG
-- Membuat Tabel Barang
CREATE TABLE Tabel_Barang (
    Kode_Barang VARCHAR(6) PRIMARY KEY,
    Nama_Barang VARCHAR(50) NOT NULL,
    Kode_Merk VARCHAR(3),
    Harga_Jual DECIMAL(12, 2) NOT NULL,
    Stok INT NOT NULL,
    Garansi VARCHAR(20) NOT NULL,
    CONSTRAINT fk_Barang_Merk
        FOREIGN KEY (Kode_Merk) REFERENCES Tabel_Merk(Kode_Merk)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
DESC Tabel_Barang;

-- Isian pada Tabel Barang
INSERT INTO Tabel_Barang (Kode_Barang, Nama_Barang, Kode_Merk, Harga_Jual, Stok, Garansi)
VALUES
('T01SHP', 'Televisi', 'SHP', 6599000, 10, '3 tahun'),
('A02PNS', 'AC', 'PNS', 2191000, 15, '5 tahun'),
('K03SMG', 'Kulkas', 'SMG', 4210000, 17, '5 tahun'),
('F04CSM', 'Kipas Angin', 'CSM', 279800, 18, '1 tahun'),
('R05PHL', 'Rice Cooker', 'PHL', 964590, 15, '2 tahun'),
('B06MYK', 'Blender', 'MYK', 256000, 16, '1 tahun'),
('T07PNS', 'Televisi', 'PNS', 4713750, 12, '2 tahun'),
('R08CSM', 'Rice Cooker', 'CSM', 359000, 21, '1 tahun');
SELECT*FROM Tabel_Barang;

#TABEL PELANGGAN
-- Membuat Tabel Pelanggan
CREATE TABLE Tabel_Pelanggan (
    ID_Pelanggan VARCHAR(5) PRIMARY KEY,
    Nama_Pelanggan VARCHAR(50) NOT NULL,
    ID_Member VARCHAR(3),
    Alamat VARCHAR(255) NOT NULL,
    Telepon VARCHAR(15) NOT NULL,
    CONSTRAINT fk_Pelanggan_Member
        FOREIGN KEY (ID_Member) REFERENCES Tabel_Member(ID_Member)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);
DESC Tabel_Pelanggan;

-- Isian pada Tabel Pelanggan
INSERT INTO Tabel_Pelanggan (ID_Pelanggan, Nama_Pelanggan, ID_Member, Alamat, Telepon)
VALUES
('GW01', 'Gerry Wahyudi', 'PLT', 'Jl. Kenjeran No.15', '081765398277'),
('YE02', 'Yayuk Eko', NULL, 'Jl. Asemrowo No.50', '082648974567'),
('RS03', 'Rudi Setiawan', 'GLD', 'Jl. Gayungan No.39', '082639857211'),
('SS04', 'Susi Sulastri', 'SLV', 'Jl. Rungkut No.22', '082748937881'),
('TH05', 'Tutik Handayani', NULL, 'Jl. Pakal No. 88', '081628912158'),
('BP06', 'Budi Pratama', NULL, 'Jl. Wonocolo No.42', '081273975381');
SELECT*FROM Tabel_Pelanggan;

#TABEL PENJUALAN
-- Buat indeks Diskon agar bisa jadi foreign key
CREATE INDEX idx_Diskon ON Tabel_Member (Diskon);
-- Membuat Tabel Penjualan
CREATE TABLE Tabel_Penjualan (
    No_Faktur VARCHAR(12) PRIMARY KEY,
    Tgl_Penjualan DATE NOT NULL,
    ID_Pelanggan VARCHAR(5),
    Diskon DECIMAL(5, 2),
    Total DECIMAL(12, 2) NOT NULL,
    ID_Petugas VARCHAR(6) NOT NULL,
    CONSTRAINT fk_Penjualan_Pelanggan
        FOREIGN KEY (ID_Pelanggan) REFERENCES Tabel_Pelanggan(ID_Pelanggan)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    CONSTRAINT fk_Penjualan_Diskon
        FOREIGN KEY (Diskon) REFERENCES Tabel_Member(Diskon)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
	CONSTRAINT fk_Penjualan_Petugas
        FOREIGN KEY (ID_Petugas) REFERENCES Tabel_Petugas(ID_Petugas)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
DESC Tabel_Penjualan;

-- Isian pada Tabel Penjualan
INSERT INTO Tabel_Penjualan (No_Faktur, Tgl_Penjualan, ID_Pelanggan, Diskon, Total, ID_Petugas)
VALUES
('010-231-512', '2023-12-05', 'GW01', 0.05, 7066480, 'PAD020'),
('021-453-103', '2023-12-07', 'TH05', 0.00, 1929180, 'EAY030'),
('020-210-427', '2023-12-05', 'BP06', 0.00, 2191000, 'PAD020'),
('005-321-674', '2023-12-13', 'YE02', 0.00, 1077000, 'PAD020'),
('012-094-267', '2023-12-15', 'GW01', 0.05, 486400, 'APT120'),
('029-011-298', '2023-12-17', 'RS03', 0.03, 4572337.5, 'APT120'),
('024-331-552', '2023-12-18', 'SS04', 0.02, 4125800, 'EAY030');
SELECT*FROM Tabel_Penjualan;

#TABEL DETAIL PENJUALAN
-- Membuat Tabel Detail Penjualan
CREATE TABLE Tabel_Detail_Penjualan (
    No_Faktur VARCHAR(12),
    Kode_Barang VARCHAR(6),
    Jumlah INT,
    Subtotal DECIMAL(12, 2) NOT NULL,
    PRIMARY KEY (No_Faktur, Kode_Barang),
    CONSTRAINT fk_DetailPenjualan_Faktur
        FOREIGN KEY (No_Faktur) REFERENCES Tabel_Penjualan(No_Faktur)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_DetailPenjualan_Barang
        FOREIGN KEY (Kode_Barang) REFERENCES Tabel_Barang(Kode_Barang)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
DESC Tabel_Detail_Penjualan;

-- Isian pada Tabel Detail Penjualan
INSERT INTO Tabel_Detail_Penjualan (No_Faktur, Kode_Barang, Jumlah, Subtotal)
VALUES
('010-231-512', 'T01SHP', 1, 6599000),
('010-231-512', 'F04CSM', 3, 839400),
('021-453-103', 'R05PHL', 2, 1929180),
('020-210-427', 'A02PNS', 1, 2191000),
('005-321-674', 'R08CSM', 3, 1077000),
('012-094-267', 'B06MYK', 2, 512000),
('029-011-298', 'T07PNS', 1, 4713750),
('024-331-552', 'K03SMG', 1, 4210000);
SELECT * FROM Tabel_Detail_Penjualan;

#TABEL DETAIL BARANG MASUK
-- Membuat Tabel Detail Barang Masuk
CREATE TABLE Tabel_Detail_Barang_Masuk (
    No_Nota INT,
    Kode_Barang VARCHAR(6),
    Jumlah INT,
    Subtotal DECIMAL(12, 2) NOT NULL,
    PRIMARY KEY (No_Nota, Kode_Barang),
    CONSTRAINT fk_DetailBarangMasuk_Nota
        FOREIGN KEY (No_Nota) REFERENCES Tabel_Barang_Masuk(No_Nota)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_DetailBarangMasuk_Barang
        FOREIGN KEY (Kode_Barang) REFERENCES Tabel_Barang(Kode_Barang)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
DESC Tabel_Detail_Barang_Masuk;

-- Isian pada Tabel Detail Barang Masuk
INSERT INTO Tabel_Detail_Barang_Masuk (No_Nota, Kode_Barang, Jumlah, Subtotal)
VALUES
(1050, 'T01SHP', 4, 20000000),
(1589, 'A02PNS', 3, 4500000),
(1290, 'K03SMG', 7, 24500000),
(1290, 'A02PNS', 2, 3100000),
(1739, 'F04CSM', 2, 400000),
(1338, 'R05PHL', 6, 4800000),
(1473, 'B06MYK', 3, 600000),
(1329, 'T07PNS', 5, 20000000),
(1967, 'R08CSM', 8, 2400000);
SELECT * FROM Tabel_Detail_Barang_Masuk;

#MEMBUAT PROSEDUR
-- 1. Procedure untuk informasi barang
-- Buat prosedur untuk mendapatkan informasi barang
DELIMITER //
CREATE PROCEDURE GetBarangInfo(IN p_KodeBarang VARCHAR(6))
BEGIN
    SELECT * FROM Tabel_Barang WHERE Kode_Barang = p_KodeBarang;
END //
DELIMITER ;
-- Buat trigger untuk update stok barang setelah barang masuk
DELIMITER //
CREATE TRIGGER UpdateStokBarangAfterInsert AFTER INSERT ON Tabel_Detail_Barang_Masuk
FOR EACH ROW
BEGIN
    DECLARE stokAwal INT;
    DECLARE stokAkhir INT;

    -- Ambil stok awal dari tabel Tabel_Barang
    SELECT Stok INTO stokAwal
    FROM Tabel_Barang
    WHERE Kode_Barang = NEW.Kode_Barang;

    -- Hitung stok akhir
    SET stokAkhir = stokAwal + NEW.Jumlah;

    -- Update stok barang di Tabel_Barang
    UPDATE Tabel_Barang
    SET Stok = stokAkhir
    WHERE Kode_Barang = NEW.Kode_Barang;
END //
DELIMITER ;
-- Manggil prosedur informasi barang
CALL GetBarangInfo('T01SHP');

-- 2. Procedure untuk informasi pelanggan
DELIMITER //
CREATE PROCEDURE GetPelangganInfo(IN p_IDPelanggan VARCHAR(5))
BEGIN
    SELECT 
        Tabel_Pelanggan.Nama_Pelanggan,
        Tabel_Pelanggan.ID_Member,
        Tabel_Member.Keterangan_Member,
        Tabel_Member.Diskon
    FROM Tabel_Pelanggan
    JOIN Tabel_Member ON Tabel_Pelanggan.ID_Member = Tabel_Member.ID_Member
    WHERE Tabel_Pelanggan.ID_Pelanggan = p_IDPelanggan;
END //
DELIMITER ;
-- Manggil prosedur informasi pelanggan
CALL GetPelangganInfo('GW01');

-- 3. Procedure untuk informasi Merk
DELIMITER //
CREATE PROCEDURE GetMerkInfo(IN p_NamaBarang VARCHAR(50))
BEGIN
    SELECT 
        Tabel_Barang.Kode_Barang,
        Tabel_Barang.Nama_Barang,
        Tabel_Barang.Kode_Merk,
        Tabel_Merk.Nama_Merk
    FROM Tabel_Barang
    JOIN Tabel_Merk ON Tabel_Barang.Kode_Merk = Tabel_Merk.Kode_Merk
    WHERE Tabel_Barang.Nama_Barang = p_NamaBarang;
END //
DELIMITER ;
-- -- Manggil prosedur informasi Merk
CALL GetMerkInfo('Televisi');

-- 4. Procedure untuk informasi Pemasok
DELIMITER //
CREATE PROCEDURE GetPemasokInfo(IN p_IDPemasok VARCHAR(2))
BEGIN
    SELECT * FROM Tabel_Pemasok WHERE ID_Pemasok = p_IDPemasok;
END //
DELIMITER ;
-- -- Manggil prosedur informasi Pemasok
CALL GetPemasokInfo('TD');

-- 5. Procedure untuk informasi petugas
-- Buat prosedur untuk mendapatkan informasi petugas beserta total transaksi penjualan
DELIMITER //
CREATE PROCEDURE GetPetugasInfo(IN p_IDPetugas VARCHAR(6))
BEGIN
	SELECT
		Tabel_Penjualan.ID_Petugas,
        Tabel_Penjualan.No_faktur,
        Tabel_Penjualan.Tgl_Penjualan,
        Tabel_Penjualan.ID_Pelanggan,
        Tabel_Pelanggan.ID_Member,
        Tabel_Penjualan.Diskon,
        Tabel_Penjualan.Total,
		Tabel_Petugas.Nama_Petugas
	FROM Tabel_Penjualan
    JOIN Tabel_Petugas ON Tabel_Petugas.ID_Petugas = Tabel_Penjualan.ID_Petugas
    JOIN Tabel_Pelanggan ON Tabel_Penjualan.ID_Pelanggan = Tabel_Pelanggan.ID_Pelanggan
    WHERE Tabel_Petugas.ID_Petugas = p_IDPetugas;
END //
DELIMITER ;
-- Manggil prosedur informasi petugas
CALL GetPetugasInfo('PAD020');

-- 6. Procedure transaksi dengan Pemasok
DELIMITER //
CREATE PROCEDURE GetTransPemasok(IN p_Tgl_Masuk DATE)
BEGIN
    SELECT
		Tabel_Barang_Masuk.Tgl_Masuk,
        Tabel_Barang_Masuk.No_Nota,
        Tabel_Pemasok.ID_Pemasok,
        Tabel_Pemasok.Nama_Pemasok,
        Tabel_Barang_Masuk.Total,
        Tabel_Petugas.Nama_Petugas
    FROM Tabel_Petugas
    JOIN Tabel_Barang_Masuk ON Tabel_Barang_Masuk.ID_Petugas = Tabel_Petugas.ID_Petugas
    JOIN Tabel_Pemasok ON Tabel_Pemasok.ID_Pemasok = Tabel_Barang_Masuk.ID_Pemasok
    WHERE Tabel_Barang_Masuk.Tgl_Masuk = p_Tgl_Masuk;
END //
DELIMITER ;
-- -- Manggil prosedur transaksi Pemasok
CALL GetTransPemasok('2023-11-20');

-- Struk Penjualan
DELIMITER //
CREATE PROCEDURE GetStrukPenjualan(IN p_NoFaktur VARCHAR(12))
BEGIN
    -- Mengambil informasi penjualan berdasarkan No_Faktur
    SELECT 
        P.No_Faktur,
        P.Tgl_Penjualan,
        P.ID_Pelanggan,
        C.Nama_Pelanggan,
        P.Diskon,
        P.Total,
        P.ID_Petugas
    FROM Tabel_Penjualan P
    JOIN Tabel_Pelanggan C ON P.ID_Pelanggan = C.ID_Pelanggan
    WHERE P.No_Faktur = p_NoFaktur;
    
    -- Mengambil detail penjualan berdasarkan No_Faktur
    SELECT 
        DP.No_Faktur,
        DP.Kode_Barang,
        B.Nama_Barang,
        DP.Jumlah,
        DP.Subtotal
    FROM Tabel_Detail_Penjualan DP
    JOIN Tabel_Barang B ON DP.Kode_Barang = B.Kode_Barang
    WHERE DP.No_Faktur = p_NoFaktur;
END //
DELIMITER ;
CALL GetStrukPenjualan('010-231-512');

