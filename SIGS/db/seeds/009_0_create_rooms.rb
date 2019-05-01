# Rooms
puts "\t - Adding actual FGA rooms"

@fga_rooms_data = [
  [183364,'FGA-I1',45,true,1,1,10],[183363,'FGA-I2',60,true,1,1,10],[183365,'FGA-I3',60,true,1,1,10],
  [183366,'FGA-I4',45,true,1,1,10],[183367,'FGA-I5',45,true,1,1,10],[183368,'FGA-I6',40,true,1,1,10],
  [183369,'FGA-I7',40,true,1,1,10],[183370,'FGA-I8',45,true,1,1,10],[183371,'FGA-I9',130,true,1,1,10],
  [183372,'FGA-I10',80,true,1,1,10],[183373,'FGA-S1',130,true,1,1,10],[183374,'FGA-S2',130,true,1,1,10],
  [183375,'FGA-S3',130,true,1,1,10],[183376,'FGA-S4',130,true,1,1,10],[183377,'FGA-S5',45,true,1,1,10],
  [183378,'FGA-S6',60,true,1,1,10],[183379,'FGA-S7',60,true,1,1,10],[183380,'FGA-S8',45,true,1,1,10],
  [183381,'FGA-S9',130,true,1,1,10],[183382,'FGA-S10',80,true,1,1,10],[183383,'FGA-Antessala I10',7,true,1,1,10],
  [183384,'FGA-Sala Multiuso',15,true,1,1,10],[183385,'FGA-ANFITEATRO',250,true,1,1,10],[183386,'FGA-LAB QUIMICA',25,true,1,1,11],
  [183387,'FGA-LAB FISICA',25,true,1,1,11],[183388,'FGA-LAB FIS MOD',25,true,1,1,11],[183389,'FGA-GALPÃO',45,true,1,1,12],
  [183390,'FGA-LAB NEI',25,true,1,1,11],[183391,'FGA-LAB SS',50,true,1,1,11],[183392,'FGA-LAB ELETRICIDADE',25,true,1,1,11],
  [183393,'FGA-LAB TERMOFLUIDOS',25,true,1,1,11],[183394,'FGA-LAB MATERIAIS',25,true,1,1,11],[183395,'FGA-LAB MOCAP',50,true,1,1,11],
  [183396,'FGA-Fórum',30,true,1,1,13]
]

for data in @fga_rooms_data do
  Room.create(code: data[0], name: data[1], capacity: data[2], active: data[3], time_grid_id: data[4], department_id: data[5], building_id: data[6], category_ids: [1])
end
