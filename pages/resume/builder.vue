<template>
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <h1 class="text-3xl font-bold text-white">สร้างเรซูเม่</h1>
        <p class="text-green-200 mt-2">สร้างเรซูเม่ที่โดดเด่นเพื่อเพิ่มโอกาสในการได้งาน</p>
      </div>
    </div>

    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
        <!-- Form Section -->
        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
          <div class="space-y-6">
            <!-- Personal Info -->
            <div>
              <h2 class="text-xl font-bold text-white mb-4">ข้อมูลส่วนตัว</h2>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <input v-model="resume.personalInfo.fullName" type="text" placeholder="ชื่อ-นามสกุล" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                <input v-model="resume.personalInfo.email" type="email" placeholder="อีเมล" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                <input v-model="resume.personalInfo.phone" type="tel" placeholder="เบอร์โทรศัพท์" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                <input v-model="resume.personalInfo.address" type="text" placeholder="ที่อยู่" 
                  class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
              </div>
              <textarea v-model="resume.personalInfo.objective" placeholder="เป้าหมายในการทำงาน" 
                class="w-full mt-4 px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400 h-24 resize-none"></textarea>
            </div>

            <!-- Experience -->
            <div>
              <h2 class="text-xl font-bold text-white mb-4">ประสบการณ์การทำงาน</h2>
              <div v-for="(exp, index) in resume.experience" :key="index" class="bg-white/5 rounded-xl p-4 mb-4">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-3">
                  <input v-model="exp.position" type="text" placeholder="ตำแหน่ง" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  <input v-model="exp.company" type="text" placeholder="บริษัท" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  <input v-model="exp.startDate" type="text" placeholder="วันที่เริ่ม (เช่น ม.ค. 2020)" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  <input v-model="exp.endDate" type="text" placeholder="วันที่สิ้นสุด (หรือ ปัจจุบัน)" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                </div>
                <textarea v-model="exp.description" placeholder="รายละเอียดงาน" 
                  class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400 h-20 resize-none"></textarea>
                <button @click="removeExperience(index)" class="mt-2 text-red-300 hover:text-red-100 text-sm">ลบประสบการณ์นี้</button>
              </div>
              <button @click="addExperience" class="bg-green-500/20 hover:bg-green-500/30 border border-green-300/30 text-green-200 px-4 py-2 rounded-lg text-sm transition-all duration-300">
                + เพิ่มประสบการณ์
              </button>
            </div>

            <!-- Education -->
            <div>
              <h2 class="text-xl font-bold text-white mb-4">การศึกษา</h2>
              <div v-for="(edu, index) in resume.education" :key="index" class="bg-white/5 rounded-xl p-4 mb-4">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <input v-model="edu.degree" type="text" placeholder="วุฒิการศึกษา" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  <input v-model="edu.school" type="text" placeholder="สถาบันการศึกษา" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  <input v-model="edu.year" type="text" placeholder="ปีที่จบการศึกษา" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  <input v-model="edu.gpa" type="text" placeholder="เกรดเฉลี่ย (ถ้ามี)" 
                    class="w-full px-3 py-2 bg-white/20 backdrop-blur-sm border border-white/30 rounded-lg text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                </div>
                <button @click="removeEducation(index)" class="mt-2 text-red-300 hover:text-red-100 text-sm">ลบการศึกษานี้</button>
              </div>
              <button @click="addEducation" class="bg-green-500/20 hover:bg-green-500/30 border border-green-300/30 text-green-200 px-4 py-2 rounded-lg text-sm transition-all duration-300">
                + เพิ่มการศึกษา
              </button>
            </div>

            <!-- Skills -->
            <div>
              <h2 class="text-xl font-bold text-white mb-4">ทักษะ</h2>
              <textarea v-model="skillsInput" @input="updateSkills" placeholder="ระบุทักษะ (คั่นด้วยเครื่องหมายจุลภาค)" 
                class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400 h-24 resize-none"></textarea>
              <div class="flex flex-wrap gap-2 mt-3">
                <span v-for="skill in resume.skills" :key="skill" 
                  class="px-3 py-1 bg-green-500/20 backdrop-blur-sm border border-green-300/30 rounded-full text-sm text-green-100">
                  {{ skill }}
                </span>
              </div>
            </div>

            <!-- Action Buttons -->
            <div class="flex gap-4 pt-6">
              <button @click="generateResume" :disabled="isGenerating" 
                class="flex-1 bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 disabled:from-gray-400 disabled:to-gray-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105 disabled:transform-none disabled:cursor-not-allowed">
                <span v-if="isGenerating" class="flex items-center justify-center gap-2">
                  <svg class="animate-spin h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  กำลังสร้าง...
                </span>
                <span v-else>สร้างเรซูเม่</span>
              </button>
              <button @click="downloadPDF" class="bg-blue-500/20 hover:bg-blue-500/30 border border-blue-300/30 text-blue-200 px-6 py-3 rounded-xl transition-all duration-300">
                ดาวน์โหลด PDF
              </button>
            </div>
          </div>
        </div>

        <!-- Preview Section -->
        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
          <h2 class="text-xl font-bold text-white mb-6">ตัวอย่างเรซูเม่</h2>
          
          <!-- Resume Preview -->
          <div class="bg-white rounded-xl p-6 text-gray-800 min-h-[600px]">
            <!-- Header -->
            <div class="text-center border-b-2 border-gray-300 pb-4 mb-6">
              <h1 class="text-2xl font-bold text-gray-900">{{ resume.personalInfo.fullName || 'ชื่อ-นามสกุล' }}</h1>
              <div class="text-sm text-gray-600 mt-2 space-y-1">
                <p v-if="resume.personalInfo.email">{{ resume.personalInfo.email }}</p>
                <p v-if="resume.personalInfo.phone">{{ resume.personalInfo.phone }}</p>
                <p v-if="resume.personalInfo.address">{{ resume.personalInfo.address }}</p>
              </div>
            </div>

            <!-- Objective -->
            <div v-if="resume.personalInfo.objective" class="mb-6">
              <h2 class="text-lg font-bold text-gray-900 border-b border-gray-300 pb-1 mb-3">เป้าหมาย</h2>
              <p class="text-sm text-gray-700">{{ resume.personalInfo.objective }}</p>
            </div>

            <!-- Experience -->
            <div v-if="resume.experience.length > 0" class="mb-6">
              <h2 class="text-lg font-bold text-gray-900 border-b border-gray-300 pb-1 mb-3">ประสบการณ์การทำงาน</h2>
              <div v-for="exp in resume.experience" :key="exp.id" class="mb-4">
                <div class="flex justify-between items-start mb-1">
                  <h3 class="font-semibold text-gray-900">{{ exp.position }}</h3>
                  <span class="text-sm text-gray-600">{{ exp.startDate }} - {{ exp.endDate }}</span>
                </div>
                <p class="text-sm font-medium text-gray-700 mb-1">{{ exp.company }}</p>
                <p class="text-sm text-gray-600">{{ exp.description }}</p>
              </div>
            </div>

            <!-- Education -->
            <div v-if="resume.education.length > 0" class="mb-6">
              <h2 class="text-lg font-bold text-gray-900 border-b border-gray-300 pb-1 mb-3">การศึกษา</h2>
              <div v-for="edu in resume.education" :key="edu.id" class="mb-3">
                <div class="flex justify-between items-start">
                  <div>
                    <h3 class="font-semibold text-gray-900">{{ edu.degree }}</h3>
                    <p class="text-sm text-gray-700">{{ edu.school }}</p>
                  </div>
                  <div class="text-right text-sm text-gray-600">
                    <p>{{ edu.year }}</p>
                    <p v-if="edu.gpa">GPA: {{ edu.gpa }}</p>
                  </div>
                </div>
              </div>
            </div>

            <!-- Skills -->
            <div v-if="resume.skills.length > 0" class="mb-6">
              <h2 class="text-lg font-bold text-gray-900 border-b border-gray-300 pb-1 mb-3">ทักษะ</h2>
              <div class="flex flex-wrap gap-2">
                <span v-for="skill in resume.skills" :key="skill" 
                  class="px-2 py-1 bg-gray-200 rounded text-sm text-gray-800">
                  {{ skill }}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'

// Resume data structure
const resume = reactive({
  personalInfo: {
    fullName: '',
    email: '',
    phone: '',
    address: '',
    objective: ''
  },
  experience: [
    {
      id: 1,
      position: '',
      company: '',
      startDate: '',
      endDate: '',
      description: ''
    }
  ],
  education: [
    {
      id: 1,
      degree: '',
      school: '',
      year: '',
      gpa: ''
    }
  ],
  skills: []
})

// Skills input
const skillsInput = ref('')
const isGenerating = ref(false)

// Functions
const updateSkills = () => {
  resume.skills = skillsInput.value
    .split(',')
    .map(skill => skill.trim())
    .filter(skill => skill.length > 0)
}

const addExperience = () => {
  resume.experience.push({
    id: Date.now(),
    position: '',
    company: '',
    startDate: '',
    endDate: '',
    description: ''
  })
}

const removeExperience = (index: number) => {
  if (resume.experience.length > 1) {
    resume.experience.splice(index, 1)
  }
}

const addEducation = () => {
  resume.education.push({
    id: Date.now(),
    degree: '',
    school: '',
    year: '',
    gpa: ''
  })
}

const removeEducation = (index: number) => {
  if (resume.education.length > 1) {
    resume.education.splice(index, 1)
  }
}

const generateResume = async () => {
  isGenerating.value = true
  // Simulate resume generation
  await new Promise(resolve => setTimeout(resolve, 2000))
  isGenerating.value = false
  alert('เรซูเม่ถูกสร้างเรียบร้อยแล้ว!')
}

const downloadPDF = () => {
  alert('ฟีเจอร์ดาวน์โหลด PDF จะพัฒนาในเวอร์ชันถัดไป')
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

.backdrop-blur-md {
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.backdrop-blur-sm {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}
</style>
