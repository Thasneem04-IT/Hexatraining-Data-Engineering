// use smart_home
// switched to db smart_home
db.sensor_logs.insertMany([
{
 device_id: 1,
 timestamp: ISODate("2026-06-01T10:00:00Z"),
 voltage: 220,
 current: 5,
 energy_kwh: 5.2
},
{
 device_id: 2,
 timestamp: ISODate("2026-06-01T12:00:00Z"),
 voltage: 220,
 current: 1,
 energy_kwh: 1.1
},
{
 device_id: 3,
 timestamp: ISODate("2026-06-01T16:00:00Z"),
 voltage: 220,
 current: 2,
 energy_kwh: 2.3
}
]);
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6a380ae921149b1617014b68'),
    '1': ObjectId('6a380ae921149b1617014b69'),
    '2': ObjectId('6a380ae921149b1617014b6a')
  }
}
db.sensor_logs.createIndex(
{
 device_id: 1
}
);
device_id_1
db.sensor_logs.createIndex(
{
 timestamp: 1
}
);
timestamp_1
db.sensor_logs.find(
{
 device_id: 1
}
);
{
  _id: ObjectId('6a380ae921149b1617014b68'),
  device_id: 1,
  timestamp: 2026-06-01T10:00:00.000Z,
  voltage: 220,
  current: 5,
  energy_kwh: 5.2
}



