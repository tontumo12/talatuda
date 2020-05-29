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
        }
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
        // {
        //     value: 'DL',
        //     text: 'Đà Lạt',
        //     img: '/dl.png'
        // },
        {
            value: 'DN',
            text: 'Đà Nẵng',
            img: '/dn.png'
        },
        // {
        //     value: 'HA',
        //     text: 'Hội An',
        //     img: '/ha.png'
        // },
        {
            value: 'NT',
            text: 'Nha Trang',
            img: '/nt.png'
        },
        {
            value: 'QN',
            text: 'Quảng Ninh',
            img: '/qn.png'
        }
    ],
    repasType:[
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