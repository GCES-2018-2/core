@pat_data = [
    ['182338', 'PAT AT 013', 50], ['183157', 'PAT AT 020', 37], ['182346', 'PAT AT 021', 50],
    ['182354', 'PAT AT 028', 50], ['182362', 'PAT AT 029', 50], ['182371', 'PAT AT 036', 50],
    ['182389', 'PAT AT 037', 50], ['182397', 'PAT AT 044', 50], ['182401', 'PAT AT 045', 50],
    ['182419', 'PAT AT 052', 50], ['182427', 'PAT AT 053', 50], ['182435', 'PAT AT 060', 50],
    ['182443', 'PAT AT 061', 50], ['182451', 'PAT AT 068', 50], ['182460', 'PAT AT 069', 50],
    ['182478', 'PAT AT 076', 50], ['182486', 'PAT AT 085', 50], ['182494', 'PAT AT 092', 50],
    ['182508', 'PAT AT 093', 50], ['182516', 'PAT AT 100', 50], ['182524', 'PAT AT 101', 50],
    ['182532', 'PAT AT 108', 50], ['182541', 'PAT AT 117', 50], ['182559', 'PAT AT 124', 50],
    ['182567', 'PAT AT 125', 50], ['182575', 'PAT AT 132', 50], ['182583', 'PAT AT 133', 50],
    ['182591', 'PAT AT 140', 50], ['183498', 'PAT AT 142', 50], ['183499', 'PAT AT 156', 50]
]

puts "\t - Adding actual PAT rooms"
for data in @pat_data do
    Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 2, category_ids: [2])
end