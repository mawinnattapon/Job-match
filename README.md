# Job Matching Platform

แพลตฟอร์มจับคู่งานที่สร้างด้วย Nuxt.js 3 และ Vue.js พร้อมดีไซน์ Glassmorphism ที่ทันสมัย

## คุณสมบัติหลัก

### สำหรับผู้หางาน
- 🔍 **ค้นหางาน** - ค้นหางานด้วยคำค้นหา ตำแหน่ง และสถานที่
- 👤 **โปรไฟล์ผู้ใช้** - จัดการข้อมูลส่วนตัว ทักษะ และประสบการณ์
- 📄 **สร้างเรซูเม่** - สร้างและจัดการเรซูเม่ด้วย Resume Builder ที่ทันสมัย
- 📋 **จัดการเรซูเม่** - ดูรายการเรซูเม่ แชร์ และดาวน์โหลด PDF
- 📊 **แดชบอร์ด** - ติดตามสถานะการสมัครงานและสถิติ
- 💼 **รายละเอียดงาน** - ดูข้อมูลงานครบถ้วนและสมัครงาน

### สำหรับบริษัท
- 📝 **ลงประกาศงาน** - สร้างประกาศงานใหม่ด้วยฟอร์มที่ครบถ้วน
- 📈 **แดชบอร์ดบริษัท** - ติดตามสถิติงานและผู้สมัคร
- 👥 **จัดการผู้สมัคร** - ดูรายชื่อและจัดการสถานะผู้สมัคร
- 🎯 **ระบบจับคู่** - ดูคะแนนความเข้ากันของผู้สมัครกับงาน

## เทคโนโลยีที่ใช้

- **Frontend**: Nuxt.js 3, Vue.js 3, TypeScript
- **Styling**: Tailwind CSS, Glassmorphism Design
- **Icons**: Heroicons
- **Animation**: CSS Animations, Backdrop Blur Effects

## การติดตั้งและรัน

### ติดตั้ง Dependencies

```bash
# npm
npm install

# pnpm
pnpm install

# yarn
yarn install

# bun
bun install
```

### รัน Development Server

เริ่มต้น development server ที่ `http://localhost:3000`:

```bash
# npm
npm run dev

# pnpm
pnpm dev

# yarn
yarn dev

# bun
bun run dev
```

### Build สำหรับ Production

```bash
# npm
npm run build

# pnpm
pnpm build

# yarn
yarn build

# bun
bun run build
```

### Preview Production Build

```bash
# npm
npm run preview

# pnpm
pnpm preview

# yarn
yarn preview

# bun
bun run preview
```

## โครงสร้างโปรเจค

```
├── pages/
│   ├── index.vue                 # หน้าแรก - ค้นหางาน
│   ├── jobs/
│   │   └── [id].vue             # รายละเอียดงาน
│   ├── profile/
│   │   └── index.vue            # โปรไฟล์ผู้ใช้
│   ├── resume/
│   │   ├── index.vue            # รายการเรซูเม่
│   │   ├── builder.vue          # สร้างเรซูเม่
│   │   └── view/
│   │       └── [id].vue         # ดูเรซูเม่สาธารณะ
│   └── company/
│       ├── dashboard.vue        # แดชบอร์ดบริษัท
│       ├── post-job.vue         # ลงประกาศงาน
│       └── applicants.vue       # ดูผู้สมัครงาน
├── components/                   # Vue Components
├── assets/                      # Static Assets
└── public/                      # Public Files
```

## หน้าต่างๆ ในระบบ

### 🏠 หน้าแรก (`/`)
- ฟอร์มค้นหางานด้วยคำค้นหา ตำแหน่ง และสถานที่
- แสดงรายการงานที่แนะนำ
- ดีไซน์ Glassmorphism พร้อมแอนิเมชันพื้นหลัง

### 💼 รายละเอียดงาน (`/jobs/[id]`)
- แสดงข้อมูลงานครบถ้วน
- ข้อมูลบริษัท เงินเดือน และสวัสดิการ
- ปุ่มสมัครงานและแชร์งาน

### 👤 โปรไฟล์ผู้ใช้ (`/profile`)
- แสดงและแก้ไขข้อมูลส่วนตัว
- จัดการทักษะและประสบการณ์
- ระบบ logout พร้อม confirmation

### 📄 รายการเรซูเม่ (`/resume`)
- แสดงรายการเรซูเม่ทั้งหมด
- สถิติการดูและดาวน์โหลด
- ระบบแชร์และจัดการเรซูเม่

### ✏️ สร้างเรซูเม่ (`/resume/builder`)
- ฟอร์มสร้างเรซูเม่แบบ Interactive
- ตัวอย่างเรซูเม่แบบ Real-time
- ระบบบันทึกและดาวน์โหลด PDF

### 👁️ ดูเรซูเม่ (`/resume/view/[id]`)
- แสดงเรซูเม่แบบสาธารณะ
- ระบบแชร์และดาวน์โหลด
- ดีไซน์เหมือนเอกสารจริง

### 🏢 แดชบอร์ดบริษัท (`/company/dashboard`)
- สถิติงานและผู้สมัคร
- รายการงานที่ลงไว้
- จัดการสถานะงาน

### 📝 ลงประกาศงาน (`/company/post-job`)
- ฟอร์มลงประกาศงานครบถ้วน
- ตัวอย่างงานแบบ Real-time
- ระบบ validation และ loading

### 👥 ดูผู้สมัครงาน (`/company/applicants`)
- รายชื่อผู้สมัครพร้อมข้อมูล
- ระบบกรองและค้นหา
- จัดการสถานะผู้สมัคร

## คุณสมบัติพิเศษ

- 🎨 **Glassmorphism Design** - ดีไซน์ทันสมัยด้วยเอฟเฟกต์แก้วใส
- 🌈 **Gradient Backgrounds** - พื้นหลังไล่สีที่สวยงาม
- ✨ **Smooth Animations** - แอนิเมชันที่ลื่นไหล
- 📱 **Responsive Design** - รองรับทุกขนาดหน้าจอ
- 🔒 **Form Validation** - ตรวจสอบข้อมูลฟอร์มอย่างครบถ้วน
- 🚀 **Performance Optimized** - ปรับแต่งประสิทธิภาพแล้ว

## การพัฒนาต่อ

- เชื่อมต่อ Backend API สำหรับข้อมูลจริง
- เพิ่มระบบ Authentication
- เพิ่มการอัปโหลดไฟล์ CV
- เพิ่ม Rich Text Editor สำหรับรายละเอียดงาน
- เพิ่มระบบแจ้งเตือน
- เพิ่มระบบสร้าง PDF เรซูเม่จริง
- เพิ่มเทมเพลตเรซูเม่หลากหลาย
- เพิ่มระบบแชร์เรซูเม่ผ่าน Social Media

## เอกสารเพิ่มเติม

ดูเอกสาร [Nuxt documentation](https://nuxt.com/docs/getting-started/introduction) และ [deployment documentation](https://nuxt.com/docs/getting-started/deployment) สำหรับข้อมูลเพิ่มเติม
