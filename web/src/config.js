export default {
    apiUrl: process.env.VUE_APP_API_URL,
    retryTimes: 4,

    location: [{
            value: 'HN',
            text: 'Hà Nội'
        },
        {
            value: 'HCM',
            text: 'Hồ Chí Minh'
        },
        {
            value: 'DN',
            text: 'Đà Nẵng'
        },
        {
            value: 'QN',
            text: 'Quảng Ninh'
        },
        {
            value: 'KH',
            text: 'Khánh Hoà'
        },
        {
            value: 'TH',
            text: 'Thanh Hoá'
        },
        {
            value: 'NB',
            text: 'Ninh Bình'
        },
        {
            value: 'ND',
            text: 'Nam Định'
        },
        {
            value: 'DL',
            text: 'Đà Lạt'
        },
        {
            value: 'LC',
            text: 'Lào Cai'
        },
        {
            value: 'HP',
            text: 'Hải phòng'
        },
        {
            value: 'VT',
            text: 'Vũng Tàu'
        },
    ],
    typeRoom:[
        {
            value: 3,
            text: 'Thường'
        },
        {
            value: 2,
            text: 'Vip'
        },
        {
            value: 1,
            text: 'vVip'
        }
    ],
    state:[
        {
            value: 1,
            text: 'Chờ xác nhận'
        },
        {
            value: 2,
            text: 'Đã xác nhận'
        },
        {
            value: 3,
            text: 'Đang sử dụng'
        },
        {
            value: 4,
            text: 'Đã trả phòng'
        }
    ],
    city:[
        {
            value: 'HN',
            text: 'Hà Nội',
            img: '/hn.png'
        },
        {
            value: 'HCM',
            text: 'Hồ Chí Minh',
            img: '/hcm.png'
        },
        
        {
            value: 'DN',
            text: 'Đà Nẵng',
            img: '/dn.png'
        },
        {
            value: 'HA',
            text: 'Hội An',
            img: '/ha.png'
        },
        {
            value: 'KH',
            text: 'Khánh Hòa',
            img: '/nt.png'
        },
        {
            value: 'HP',
            text: 'Hải Phòng',
            img: '/hp.jpg'
        },
        {
            value: 'VT',
            text: 'Vũng Tàu',
            img: '/vt.jpg'
        },
    ],
    repasType:[
        {
            value: null,
            text: 'Chọn loại món ăn'
        },
        {
            value: 'M',
            text: 'Món mặn'
        },
        {
            value: 'C',
            text: 'Món chay'
        },
        {
            value: 'R',
            text: 'Món rau'
        },
        {
            value: 'L',
            text: 'Lẩu'
        },
        {
            value: 'P',
            text: 'Hải sản'
        }
  
    ]
}