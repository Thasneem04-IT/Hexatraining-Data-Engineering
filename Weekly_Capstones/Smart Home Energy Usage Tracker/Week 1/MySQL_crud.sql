create database tracker;
use tracker;

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL
);


CREATE TABLE devices (
    device_id INT AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(100),
    room_id INT,
    device_type VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (room_id)
    REFERENCES rooms(room_id)
);


CREATE TABLE energy_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    device_id INT,
    energy_kwh DECIMAL(10,2),
    log_time DATETIME,
    FOREIGN KEY (device_id)
    REFERENCES devices(device_id)
);


INSERT INTO rooms(room_name)
VALUES
('Living Room'),
('Bedroom'),
('Kitchen');



INSERT INTO devices
(device_name, room_id, device_type, status)
VALUES
('AC',1,'Cooling','ON'),
('TV',1,'Entertainment','OFF'),
('Fan',2,'Cooling','ON'),
('Refrigerator',3,'Appliance','ON');


INSERT INTO energy_logs
(device_id, energy_kwh, log_time)
VALUES
(1,5.2,'2026-06-01 10:00:00'),
(1,3.8,'2026-06-01 15:00:00'),
(2,1.1,'2026-06-01 12:00:00'),
(3,2.3,'2026-06-01 16:00:00'),
(4,4.6,'2026-06-01 18:00:00');


INSERT INTO devices
(device_name, room_id, device_type, status)
VALUES
('Washing Machine',3,'Appliance','OFF');



SELECT *
FROM devices;



UPDATE devices
SET status='OFF'
WHERE device_id=1;

DELETE FROM devices
WHERE device_id=5;

DELIMITER $$

CREATE PROCEDURE GetRoomEnergyUsage()
BEGIN

SELECT
    r.room_name,
    DATE(e.log_time) AS usage_date,
    SUM(e.energy_kwh) AS total_energy
FROM energy_logs e
JOIN devices d
ON e.device_id = d.device_id
JOIN rooms r
ON d.room_id = r.room_id
GROUP BY
    r.room_name,
    DATE(e.log_time);

END $$

DELIMITER ;



CALL GetRoomEnergyUsage();



