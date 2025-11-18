-- 1. TAO KEYSPACE CHINH ( iot_industry )
CREATE KEYSPACE IF NOT EXISTS iot_industry
WITH replication = {
  'class' : 'SimpleStrategy',
  'replication_factor' : 3
};

-- SỬ DỤNG KEYSPACE VỪA TẠO
USE iot_industry;

-- 2. THIET KE BANG CHINH : sensor_data
-- Truy van : Theo machine_id, sensor_type va day
CREATE TABLE IF NOT EXISTS sensor_data (
  machine_id text,
  sensor_type text,
  day date,
  timestamp timestamp,
  sensor_id text,
  value double,
  unit text,
  PRIMARY KEY (
    (machine_id, sensor_type, day), -- Partition Key
    timestamp                       -- Clustering Column
  )
) WITH CLUSTERING ORDER BY (timestamp DESC);

-- 3. THIET KE BANG TONG HOP : sensor_hourly_avg
-- Truy van : Theo machine_id, sensor_type va day, sap xep theo gio
CREATE TABLE IF NOT EXISTS sensor_hourly_avg (
  machine_id text,
  sensor_type text,
  day date,
  hour int,        -- Gio trong ngay (0 -23)
  avg_value double, -- Gia tri trung binh
  unit text,
  PRIMARY KEY (
    (machine_id, sensor_type, day), -- Partition Key
    hour                            -- Clustering Column
  )
);

-- 4. THIET KE BANG DU LIEU MOI NHAT : latest_sensor_data
-- Truy van : Theo machine_id, sensor_type ; ghi de (overwrite) theo sensor_id
CREATE TABLE IF NOT EXISTS latest_sensor_data (
  machine_id text,
  sensor_type text,
  sensor_id text, -- ID duy nhat cua cam bien
  timestamp timestamp,
  value double,
  unit text,
  PRIMARY KEY (
    (machine_id, sensor_type), -- Partition Key
    sensor_id                  -- Clustering Column
  )
);

-- GHI DỮ LIỆU

-- 1. Dữ liệu mẫu cho bảng CHÍNH: sensor_data
-- Ghi lại 3 điểm dữ liệu chi tiết cho máy M01, cảm biến 'temperature' vào ngày 2025-10-26
INSERT INTO sensor_data (machine_id, sensor_type, day, timestamp, sensor_id, value, unit)
VALUES ('M01', 'temperature', '2025-10-26', '2025-10-26T08:00:00+0700', 'T001', 55.2, 'Celsius');

INSERT INTO sensor_data (machine_id, sensor_type, day, timestamp, sensor_id, value, unit)
VALUES ('M01', 'temperature', '2025-10-26', '2025-10-26T09:15:30+0700', 'T001', 56.1, 'Celsius');

INSERT INTO sensor_data (machine_id, sensor_type, day, timestamp, sensor_id, value, unit)
VALUES ('M01', 'temperature', '2025-10-26', '2025-10-26T10:05:00+0700', 'T002', 57.0, 'Celsius');

-- Ghi lại 1 điểm dữ liệu cho cảm biến 'vibration' (sử dụng cho truy vấn 2)
INSERT INTO sensor_data (machine_id, sensor_type, day, timestamp, sensor_id, value, unit)
VALUES ('M01', 'vibration', '2025-10-26', '2025-10-26T10:05:00+0700', 'V001', 1.85, 'Hz');

---

-- 2. Dữ liệu mẫu cho bảng TỔNG HỢP: sensor_hourly_avg
-- Ghi lại giá trị trung bình theo giờ cho máy M01, 'temperature' vào ngày 2025-10-26 (sử dụng cho truy vấn 3)
INSERT INTO sensor_hourly_avg (machine_id, sensor_type, day, hour, avg_value, unit)
VALUES ('M01', 'temperature', '2025-10-26', 8, 55.5, 'Celsius');

INSERT INTO sensor_hourly_avg (machine_id, sensor_type, day, hour, avg_value, unit)
VALUES ('M01', 'temperature', '2025-10-26', 9, 56.3, 'Celsius');

INSERT INTO sensor_hourly_avg (machine_id, sensor_type, day, hour, avg_value, unit)
VALUES ('M01', 'temperature', '2025-10-26', 10, 57.1, 'Celsius');

-- Ghi lại giá trị trung bình cho cảm biến 'vibration'
INSERT INTO sensor_hourly_avg (machine_id, sensor_type, day, hour, avg_value, unit)
VALUES ('M01', 'vibration', '2025-10-26', 8, 1.5, 'Hz');

---

-- 3. Dữ liệu mẫu cho bảng MỚI NHẤT: latest_sensor_data
-- Ghi lại dữ liệu mới nhất cho các cảm biến.
-- Cảm biến T001 (temperature)
INSERT INTO latest_sensor_data (machine_id, sensor_type, sensor_id, timestamp, value, unit)
VALUES ('M01', 'temperature', 'T001', '2025-10-26T09:15:30+0700', 56.1, 'Celsius');
-- Cảm biến T002 (temperature)
INSERT INTO latest_sensor_data (machine_id, sensor_type, sensor_id, timestamp, value, unit)
VALUES ('M01', 'temperature', 'T002', '2025-10-26T10:05:00+0700', 57.0, 'Celsius');
-- Cảm biến V001 (vibration) (sử dụng cho truy vấn 2)
INSERT INTO latest_sensor_data (machine_id, sensor_type, sensor_id, timestamp, value, unit)
VALUES ('M01', 'vibration', 'V001', '2025-10-26T10:05:00+0700', 1.85, 'Hz');
-- Ghi đè dữ liệu (thể hiện tính chất "latest" - ví dụ dữ liệu mới hơn cho T001)
INSERT INTO latest_sensor_data (machine_id, sensor_type, sensor_id, timestamp, value, unit)
VALUES ('M01', 'temperature', 'T001', '2025-10-26T11:30:00+0700', 57.5, 'Celsius');

-- CÁC TRUY VẤN CƠ BẢN
SELECT timestamp, value, unit
FROM sensor_data
WHERE machine_id = 'M01'
  AND sensor_type = 'temperature'
  AND day = '2025-10-26'
  AND timestamp >= '2025-10-26T00:00:00+0700'
  AND timestamp <= '2025-10-26T23:59:59+0700';

SELECT *
FROM latest_sensor_data
WHERE machine_id = 'M01'
  AND sensor_type = 'vibration';

SELECT hour, avg_value
FROM sensor_hourly_avg
WHERE machine_id = 'M01'
  AND sensor_type = 'temperature'
  AND day = '2025-10-26';
