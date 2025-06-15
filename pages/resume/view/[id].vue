<template>
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
      <div class="absolute bottom-1/4 left-1/3 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-4">
            <button @click="goBack" class="p-2 hover:bg-white/20 rounded-xl transition-colors">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
              </svg>
            </button>
            <div>
              <h1 class="text-3xl font-bold text-white">{{ resume?.title || 'เรซูเม่' }}</h1>
              <p class="text-green-200 mt-2">{{ resume?.name }}</p>
            </div>
          </div>
          <div class="flex gap-3">
            <button @click="downloadPDF" 
              class="bg-blue-500/20 hover:bg-blue-500/30 border border-blue-300/30 text-blue-200 px-4 py-2 rounded-xl transition-all duration-300 flex items-center gap-2">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              ดาวน์โหลด PDF
            </button>
            <button @click="shareResume" 
              class="bg-green-500/20 hover:bg-green-500/30 border border-green-300/30 text-green-200 px-4 py-2 rounded-xl transition-all duration-300 flex items-center gap-2">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.367 2.684 3 3 0 00-5.367-2.684z" />
              </svg>
              แชร์
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Content -->
    <div class="relative z-10 max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <div v-if="isLoading" class="flex justify-center py-12">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-white"></div>
      </div>

      <div v-else-if="resume" class="bg-white rounded-2xl shadow-2xl overflow-hidden">
        <!-- Resume Header -->
        <div class="bg-gradient-to-r from-green-600 to-blue-600 text-white p-8">
          <div class="flex items-center gap-6">
            <div class="w-24 h-24 bg-white/20 rounded-full flex items-center justify-center text-3xl font-bold">
              {{ getInitials(resume.name) }}
            </div>
            <div class="flex-1">
              <h1 class="text-4xl font-bold mb-2">{{ resume.name }}</h1>
              <p class="text-xl text-green-100 mb-3">{{ resume.title }}</p>
              <div class="flex flex-wrap gap-4 text-sm">
                <span class="flex items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                  </svg>
                  {{ resume.email }}
                </span>
                <span class="flex items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21L6.5 10.5a11.002 11.002 0 004.5 4.5l1.13-3.724a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                  </svg>
                  {{ resume.phone }}
                </span>
                <span class="flex items-center gap-1">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  {{ resume.location }}
                </span>
              </div>
            </div>
          </div>
        </div>

        <!-- Resume Content -->
        <div class="p-8 space-y-8">
          <!-- Summary -->
          <section v-if="resume.summary">
            <h2 class="text-2xl font-bold text-gray-900 mb-4 border-b-2 border-green-500 pb-2">สรุปประวัติ</h2>
            <p class="text-gray-700 leading-relaxed">{{ resume.summary }}</p>
          </section>

          <!-- Experience -->
          <section v-if="resume.experience && resume.experience.length > 0">
            <h2 class="text-2xl font-bold text-gray-900 mb-4 border-b-2 border-green-500 pb-2">ประสบการณ์การทำงาน</h2>
            <div class="space-y-6">
              <div v-for="(exp, index) in resume.experience" :key="index" class="border-l-4 border-green-500 pl-6">
                <h3 class="text-xl font-semibold text-gray-900">{{ exp.position }}</h3>
                <p class="text-lg text-green-600 font-medium">{{ exp.company }}</p>
                <p class="text-gray-600 mb-2">{{ exp.startDate }} - {{ exp.endDate || 'ปัจจุบัน' }}</p>
                <p class="text-gray-700">{{ exp.description }}</p>
              </div>
            </div>
          </section>

          <!-- Education -->
          <section v-if="resume.education && resume.education.length > 0">
            <h2 class="text-2xl font-bold text-gray-900 mb-4 border-b-2 border-green-500 pb-2">การศึกษา</h2>
            <div class="space-y-6">
              <div v-for="(edu, index) in resume.education" :key="index" class="border-l-4 border-blue-500 pl-6">
                <h3 class="text-xl font-semibold text-gray-900">{{ edu.degree }}</h3>
                <p class="text-lg text-blue-600 font-medium">{{ edu.school }}</p>
                <p class="text-gray-600 mb-2">{{ edu.startDate }} - {{ edu.endDate || 'ปัจจุบัน' }}</p>
                <p v-if="edu.gpa" class="text-gray-700">เกรดเฉลี่ย: {{ edu.gpa }}</p>
              </div>
            </div>
          </section>

          <!-- Skills -->
          <section v-if="resume.skills && resume.skills.length > 0">
            <h2 class="text-2xl font-bold text-gray-900 mb-4 border-b-2 border-green-500 pb-2">ทักษะ</h2>
            <div class="flex flex-wrap gap-3">
              <span v-for="skill in resume.skills" :key="skill" 
                class="px-4 py-2 bg-gradient-to-r from-green-100 to-blue-100 text-green-800 rounded-full text-sm font-medium border border-green-200">
                {{ skill }}
              </span>
            </div>
          </section>

          <!-- Languages -->
          <section v-if="resume.languages && resume.languages.length > 0">
            <h2 class="text-2xl font-bold text-gray-900 mb-4 border-b-2 border-green-500 pb-2">ภาษา</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div v-for="lang in resume.languages" :key="lang.name" class="flex justify-between items-center p-3 bg-gray-50 rounded-lg">
                <span class="font-medium text-gray-900">{{ lang.name }}</span>
                <span class="text-green-600 font-medium">{{ lang.level }}</span>
              </div>
            </div>
          </section>

          <!-- Certifications -->
          <section v-if="resume.certifications && resume.certifications.length > 0">
            <h2 class="text-2xl font-bold text-gray-900 mb-4 border-b-2 border-green-500 pb-2">ใบรับรอง</h2>
            <div class="space-y-4">
              <div v-for="cert in resume.certifications" :key="cert.name" class="p-4 bg-yellow-50 rounded-lg border border-yellow-200">
                <h3 class="font-semibold text-gray-900">{{ cert.name }}</h3>
                <p class="text-yellow-700">{{ cert.issuer }}</p>
                <p class="text-gray-600 text-sm">{{ cert.date }}</p>
              </div>
            </div>
          </section>
        </div>
      </div>

      <!-- Not Found -->
      <div v-else class="text-center py-12">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-16 w-16 text-red-300 mx-auto mb-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L4.082 16.5c-.77.833.192 2.5 1.732 2.5z" />
        </svg>
        <p class="text-red-200 text-lg">ไม่พบเรซูเม่</p>
        <p class="text-red-300 text-sm mb-4">เรซูเม่ที่คุณค้นหาไม่มีอยู่หรือถูกลบแล้ว</p>
        <button @click="goBack" 
          class="bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300">
          กลับ
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

const route = useRoute()
const router = useRouter()

const isLoading = ref(true)
const resume = ref<any>(null)

// Sample resume data
const sampleResumes: any = {
  '1': {
    id: '1',
    title: 'Frontend Developer',
    name: 'สมชาย ใจดี',
    email: 'somchai@example.com',
    phone: '081-234-5678',
    location: 'กรุงเทพมหานคร',
    summary: 'นักพัฒนาซอฟต์แวร์ Frontend ที่มีประสบการณ์ 5 ปี ในการพัฒนาเว็บแอปพลิเคชันด้วย Vue.js, React และ Angular มีความเชี่ยวชาญในการออกแบบ UI/UX และการพัฒนา Responsive Web Design',
    experience: [
      {
        position: 'Senior Frontend Developer',
        company: 'ABC Technology Co., Ltd.',
        startDate: '2022-01',
        endDate: null,
        description: 'พัฒนาและดูแลเว็บแอปพลิเคชันหลักของบริษัท ใช้ Vue.js และ Nuxt.js ทำงานร่วมกับทีม Backend และ Design เพื่อสร้างประสบการณ์ผู้ใช้ที่ดี'
      },
      {
        position: 'Frontend Developer',
        company: 'XYZ Digital Agency',
        startDate: '2020-03',
        endDate: '2021-12',
        description: 'พัฒนาเว็บไซต์และเว็บแอปพลิเคชันสำหรับลูกค้าหลากหลายอุตสาหกรรม ใช้ React, Vue.js และ WordPress'
      }
    ],
    education: [
      {
        degree: 'ปริญญาตรี วิทยาการคอมพิวเตอร์',
        school: 'มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี',
        startDate: '2016',
        endDate: '2020',
        gpa: '3.45'
      }
    ],
    skills: [
      'JavaScript', 'TypeScript', 'Vue.js', 'Nuxt.js', 'React', 'Angular',
      'HTML5', 'CSS3', 'Sass', 'Tailwind CSS', 'Bootstrap',
      'Git', 'Webpack', 'Vite', 'Node.js', 'REST API'
    ],
    languages: [
      { name: 'ไทย', level: 'เจ้าของภาษา' },
      { name: 'อังกฤษ', level: 'ดี' },
      { name: 'ญี่ปุ่น', level: 'พื้นฐาน' }
    ],
    certifications: [
      {
        name: 'Vue.js Certified Developer',
        issuer: 'Vue School',
        date: '2023-06'
      },
      {
        name: 'AWS Cloud Practitioner',
        issuer: 'Amazon Web Services',
        date: '2023-03'
      }
    ]
  },
  '2': {
    id: '2',
    title: 'Full Stack Developer',
    name: 'สมชาย ใจดี',
    email: 'somchai@example.com',
    phone: '081-234-5678',
    location: 'กรุงเทพมหานคร',
    summary: 'นักพัฒนาซอฟต์แวร์ Full Stack ที่มีประสบการณ์ในการพัฒนาทั้ง Frontend และ Backend มีความเชี่ยวชาญใน JavaScript, Python และ Database Design',
    experience: [
      {
        position: 'Full Stack Developer',
        company: 'Tech Startup Co., Ltd.',
        startDate: '2021-06',
        endDate: null,
        description: 'พัฒนาระบบ E-commerce ตั้งแต่ Frontend จนถึง Backend และ Database ใช้ Vue.js, Node.js และ PostgreSQL'
      }
    ],
    education: [
      {
        degree: 'ปริญญาตรี วิศวกรรมซอฟต์แวร์',
        school: 'จุฬาลงกรณ์มหาวิทยาลัย',
        startDate: '2017',
        endDate: '2021',
        gpa: '3.67'
      }
    ],
    skills: [
      'JavaScript', 'Python', 'Vue.js', 'Node.js', 'Express.js',
      'PostgreSQL', 'MongoDB', 'Docker', 'AWS', 'Git'
    ],
    languages: [
      { name: 'ไทย', level: 'เจ้าของภาษา' },
      { name: 'อังกฤษ', level: 'ดีมาก' }
    ],
    certifications: []
  }
}

onMounted(() => {
  fetchResume()
})

const fetchResume = () => {
  isLoading.value = true
  
  // Simulate API call
  setTimeout(() => {
    const resumeId = route.params.id as string
    resume.value = sampleResumes[resumeId] || null
    isLoading.value = false
  }, 1000)
}

const getInitials = (name: string) => {
  return name.split(' ').map(n => n[0]).join('').toUpperCase()
}

const goBack = () => {
  router.back()
}

const downloadPDF = () => {
  alert('ดาวน์โหลดเรซูเม่เป็น PDF')
}

const shareResume = () => {
  const shareUrl = window.location.href
  navigator.clipboard.writeText(shareUrl).then(() => {
    alert('ลิงก์แชร์ถูกคัดลอกแล้ว!')
  })
}
</script>

<style scoped>
@keyframes blob {
  0% { transform: translate(0px, 0px) scale(1); }
  33% { transform: translate(30px, -50px) scale(1.1); }
  66% { transform: translate(-20px, 20px) scale(0.9); }
  100% { transform: translate(0px, 0px) scale(1); }
}

.animate-blob {
  animation: blob 7s infinite;
}

.animation-delay-2000 { animation-delay: 2s; }
.animation-delay-4000 { animation-delay: 4s; }

.backdrop-blur-md {
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}
</style>
