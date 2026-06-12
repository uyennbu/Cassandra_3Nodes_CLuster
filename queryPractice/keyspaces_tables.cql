/**
    1. TẠO KEYSPACE TRONG CASSNANDRA
    - Các điểm cần nhớ về keyspace:
        + Tương đương với database trong RDBMS
        + Replication factor: default = 3: số lượng replication cho mỗi bản ghi dữ liệu
        + Replication strategies: chiến lược lưu trữ các bản ghi dữ liệu.
            + SimpleStrategies: đơn giản, dùng khi Cluster có 1 datacenter duy nhất
            + NetworkTopologyStrategy: dùng khi có nhiều datacenter
        + durable_writes: default = true: dữ liệu write có được theo dõi bằng commit log không
        Whether to use the commit log for updates on this keyspace (disable this option at your own risk!).
*/
CREATE KEYSPACE excelsior
   WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 3};
-- Giải thích như sau: cluster có nhiều datacenter, datacenter 1 chứa 1 replica, dc2 chứa 3 replica của dữ liệu
-- tổng mỗi bản ghi sẽ có 4 replica
-- không chạy lệnh này vì cluster chỉ gồm 3 nodes trên 1 dc
CREATE KEYSPACE excalibur
   WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1' : 1, 'DC2' : 3}
   AND durable_writes = false;
-- Có thể khai báo đồng thời replicas cho toàn bộ dcs:
-- Hai lệnh dưới là tương tự nhau:
CREATE KEYSPACE excalibur
    WITH replication = {'class': 'NetworkTopologyStrategy', 'replication_factor' : 3};

CREATE KEYSPACE excalibur 
    WITH replication = {'class': 'NetworkTopologyStrategy', 'DC1': '3', 'DC2': '3'} 
    AND durable_writes = true;

/**
    2. Sử dụng, xem cài đặt, sửa, xóa keyspace
*/
-- Xem các cài đặt keyspace (xem lại lệnh create): 
-- DESCRIBE KEYSPACE + keyspace_name
DESCRIBE KEYSPACE excalibur; 

-- Sử dụng keyspace:
USE excelsior;

-- Sửa cài đặt
-- lệnh sau sẽ báo lỗi nếu keyspace không tồn tại
-- tránh lỗi bằng if exists
ALTER KEYSPACE excelsior
    WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 4};

-- Xóa
-- DROP KEYSPACE [ IF EXISTS ] keyspace_name
DROP KEYSPACE excelsior;

/**
    3. Thao tác với table
*/

-- Tạo mới
CREATE TABLE monkey_species (
    species text PRIMARY KEY,
    common_name text,
    population varint,
    average_size int
) WITH comment='Important biological records';

CREATE TABLE timeline (
    userid uuid,
    posted_month int,
    posted_time uuid,
    body text,
    posted_by text,
    PRIMARY KEY (userid, posted_month, posted_time)
) WITH compaction = { 'class' : 'LeveledCompactionStrategy' };

CREATE TABLE loads (
    machine inet,
    cpu int,
    mtime timeuuid,
    load float,
    PRIMARY KEY ((machine, cpu), mtime)
) WITH CLUSTERING ORDER BY (mtime DESC);

-- static columns: columns that shared by all rows
CREATE TABLE t (
    pk int,
    t int,
    v text,
    s text static,
    PRIMARY KEY (pk, t)
);
INSERT INTO t (pk, t, v, s) VALUES (0, 0, 'val0', 'static0');
INSERT INTO t (pk, t, v, s) VALUES (0, 1, 'val1', 'static1');
SELECT * FROM t;