<template>
  <div class="min-h-screen bg-gradient-to-br from-green-500 via-blue-600 to-yellow-500 relative overflow-hidden">
    <!-- Animated Background -->
    <div class="absolute inset-0">
      <!-- Floating Blobs -->
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-green-300 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob"></div>
      <div class="absolute top-1/3 right-1/4 w-80 h-80 bg-blue-300 rounded-full mix-blend-multiply filter blur-3xl opacity-25 animate-blob animation-delay-2000"></div>
      <div class="absolute bottom-1/4 left-1/3 w-72 h-72 bg-purple-400 rounded-full mix-blend-multiply filter blur-3xl opacity-20 animate-blob animation-delay-4000"></div>
      <div class="absolute bottom-1/3 right-1/3 w-80 h-80 bg-yellow-300 rounded-full mix-blend-multiply filter blur-3xl opacity-15 animate-blob animation-delay-6000"></div>
      
      <!-- Sparkle Effects -->
      <div class="absolute top-20 left-20 w-2 h-2 bg-white rounded-full animate-pulse"></div>
      <div class="absolute top-40 right-32 w-1 h-1 bg-green-200 rounded-full animate-ping"></div>
      <div class="absolute bottom-40 left-40 w-1.5 h-1.5 bg-white rounded-full animate-pulse animation-delay-1000"></div>
      <div class="absolute bottom-20 right-20 w-2 h-2 bg-green-200 rounded-full animate-ping animation-delay-2000"></div>
    </div>

    <!-- Header -->
    <div class="relative z-10 bg-white/10 backdrop-blur-md border-b border-white/20">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div class="flex items-center justify-between">
          <h1 class="text-3xl font-bold text-white">โปรไฟล์ของฉัน</h1>
          <div class="flex items-center gap-3">
            <button 
              v-if="!isLoading && !isEditing"
              @click="toggleEdit"
              class="bg-white/20 backdrop-blur-sm border border-white/30 text-white hover:bg-white/30 font-medium py-3 px-6 rounded-xl transition-all duration-300 flex items-center gap-2"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
              </svg>
              แก้ไขโปรไฟล์
            </button>
            <button 
              @click="logout"
              class="bg-red-500/20 backdrop-blur-sm border border-red-300/30 text-white hover:bg-red-500/30 font-medium py-3 px-6 rounded-xl transition-all duration-300 flex items-center gap-2"
            >
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
              </svg>
              ออกจากระบบ
            </button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Content -->
    <div class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Loading State -->
      <div v-if="isLoading" class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl flex justify-center items-center min-h-[400px]">
        <div class="text-center">
          <svg class="animate-spin h-12 w-12 text-white mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
          </svg>
          <p class="mt-4 text-lg text-white">กำลังโหลดข้อมูล...</p>
        </div>
      </div>

      <!-- Profile Content -->
      <div v-else-if="user" class="space-y-8">
        <!-- Main Profile Card -->
        <div class="bg-white/10 backdrop-blur-md rounded-2xl p-8 border border-white/20 shadow-2xl">
          <div class="flex flex-col lg:flex-row gap-8">
            <!-- Profile Image & Basic Info -->
            <div class="flex-shrink-0 text-center lg:text-left">
              <div class="w-32 h-32 mx-auto lg:mx-0 bg-white/20 backdrop-blur-sm rounded-2xl overflow-hidden flex items-center justify-center border border-white/30 mb-4">
                <img :src="user?.avatar || ''" :alt="user?.name || ''" class="w-full h-full object-cover">
              </div>
              <div class="bg-gradient-to-r from-green-400 to-yellow-400 text-green-900 px-4 py-2 rounded-full font-bold text-sm inline-block">
                {{ user?.profileCompletion || 0 }}% สมบูรณ์
              </div>
            </div>
            
            <!-- Main Info -->
            <div class="flex-grow">
              <div v-if="!isEditing">
                <h2 class="text-3xl font-bold text-white mb-2">{{ user?.name || '' }}</h2>
                <p class="text-xl text-green-200 mb-4">{{ user?.title || '' }}</p>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                  <div class="flex items-center text-green-100">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    {{ user?.location || '' }}
                  </div>
                  <div class="flex items-center text-green-100">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                    </svg>
                    {{ user?.email || '' }}
                  </div>
                  <div class="flex items-center text-green-100">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                    </svg>
                    {{ user?.phone || '' }}
                  </div>
                  <div class="flex items-center text-green-100">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2-2v2m8 0V6a2 2 0 012 2v6a2 2 0 01-2 2H6a2 2 0 01-2-2V8a2 2 0 012-2V6" />
                    </svg>
                    ประสบการณ์ {{ user?.experience || '' }}
                  </div>
                </div>
                
                <div class="mb-6">
                  <h3 class="text-lg font-semibold text-white mb-2">เกี่ยวกับฉัน</h3>
                  <p class="text-green-100 leading-relaxed">{{ user?.bio || '' }}</p>
                </div>
                
                <div>
                  <h3 class="text-lg font-semibold text-white mb-3">ทักษะ</h3>
                  <div class="flex flex-wrap gap-2">
                    <span v-for="skill in (user?.skills || [])" :key="skill" 
                      class="px-3 py-1 bg-white/20 backdrop-blur-sm border border-white/30 rounded-full text-sm text-white skill-tag">
                      {{ skill }}
                    </span>
                  </div>
                </div>
              </div>
              
              <!-- Edit Form -->
              <div v-else class="space-y-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                  <div>
                    <label class="block text-sm font-medium text-white mb-2">ชื่อ-นามสกุล</label>
                    <input v-model="editForm.name" type="text" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-white mb-2">ตำแหน่งงาน</label>
                    <input v-model="editForm.title" type="text" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-white mb-2">อีเมล</label>
                    <input v-model="editForm.email" type="email" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-white mb-2">เบอร์โทรศัพท์</label>
                    <input v-model="editForm.phone" type="tel" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-white mb-2">ที่อยู่</label>
                    <input v-model="editForm.location" type="text" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-white mb-2">ประสบการณ์</label>
                    <input v-model="editForm.experience" type="text" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400">
                  </div>
                </div>
                
                <div>
                  <label class="block text-sm font-medium text-white mb-2">เกี่ยวกับฉัน</label>
                  <textarea v-model="editForm.bio" rows="4" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400"></textarea>
                </div>
                
                <div>
                  <label class="block text-sm font-medium text-white mb-2">ทักษะ (คั่นด้วยเครื่องหมายจุลภาค)</label>
                  <input v-model="skillsText" type="text" class="w-full px-4 py-3 bg-white/20 backdrop-blur-sm border border-white/30 rounded-xl text-white placeholder-green-200 focus:outline-none focus:ring-2 focus:ring-green-400" placeholder="JavaScript, Vue.js, Node.js">
                </div>
                
                <div class="flex gap-3">
                  <button @click="saveProfile" 
                    class="flex-1 bg-gradient-to-r from-green-400 to-yellow-400 hover:from-green-500 hover:to-yellow-500 text-green-900 font-bold py-3 px-6 rounded-xl transition-all duration-300 transform hover:scale-105 shadow-lg">
                    บันทึกการแก้ไข
                  </button>
                  <button @click="cancelEdit"
                    class="bg-white/20 backdrop-blur-sm border border-white/30 text-white hover:bg-white/30 font-medium py-3 px-6 rounded-xl transition-all duration-300">
                    ยกเลิก
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Additional Info Cards -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <!-- Education & Experience -->
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl card-hover">
            <h3 class="text-xl font-bold text-white mb-4">การศึกษาและประสบการณ์</h3>
            <div class="space-y-4">
              <div class="flex items-start">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3 mt-1 text-yellow-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                </svg>
                <div>
                  <h4 class="font-semibold text-white">{{ user?.education || '' }}</h4>
                  <p class="text-green-200 text-sm">มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี</p>
                  <p class="text-green-200 text-sm">2561 - 2565</p>
                </div>
              </div>
              <div class="flex items-start">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3 mt-1 text-blue-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                </svg>
                <div>
                  <h4 class="font-semibold text-white">Senior Frontend Developer</h4>
                  <p class="text-green-200 text-sm">TechCorp Thailand</p>
                  <p class="text-green-200 text-sm">2567 - ปัจจุบัน</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Statistics -->
          <div class="bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20 shadow-2xl card-hover">
            <h3 class="text-xl font-bold text-white mb-4">สถิติ</h3>
            <div class="grid grid-cols-2 gap-4">
              <div class="text-center">
                <div class="text-2xl font-bold text-white">{{ user?.stats?.jobsApplied || 0 }}</div>
                <div class="text-green-200 text-sm">งานที่สมัคร</div>
              </div>
              <div class="text-center">
                <div class="text-2xl font-bold text-white">{{ user?.stats?.interviews || 0 }}</div>
                <div class="text-green-200 text-sm">สัมภาษณ์</div>
              </div>
              <div class="text-center">
                <div class="text-2xl font-bold text-white">{{ user?.stats?.offers || 0 }}</div>
                <div class="text-green-200 text-sm">ข้อเสนองาน</div>
              </div>
              <div class="text-center">
                <div class="text-2xl font-bold text-white">{{ user?.stats?.profileViews || 0 }}</div>
                <div class="text-green-200 text-sm">ดูโปรไฟล์</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'

// ตัวแปรสำหรับเก็บข้อมูลผู้ใช้
const user = ref(null)
const isLoading = ref(false)
const isEditing = ref(false)

// ฟอร์มสำหรับแก้ไขข้อมูล
const editForm = reactive({
  name: '',
  title: '',
  email: '',
  phone: '',
  location: '',
  experience: '',
  bio: ''
})

// ตัวแปรสำหรับจัดการทักษะ
const skillsText = ref('')

// ฟังก์ชันสำหรับดึงข้อมูลโปรไฟล์ผู้ใช้
const fetchUserProfile = () => {
  isLoading.value = true
  setTimeout(() => {
    user.value = {
      id: '1',
      name: 'สมชาย ใจดี',
      email: 'somchai@example.com',
      phone: '081-234-5678',
      avatar: 'https://placehold.co/200x200/00A155/FFFFFF?text=SC',
      title: 'นักพัฒนาซอฟต์แวร์ Full Stack',
      location: 'กรุงเทพมหานคร',
      experience: '5 ปี',
      education: 'ปริญญาตรี วิทยาการคอมพิวเตอร์',
      bio: 'นักพัฒนาซอฟต์แวร์ที่มีประสบการณ์ในการพัฒนาเว็บแอปพลิเคชันและมีความสนใจในเทคโนโลยีใหม่ๆ มีความเชี่ยวชาญในการใช้ Vue.js, Node.js และฐานข้อมูล รักการเรียนรู้และพัฒนาตนเองอย่างต่อเนื่อง',
      skills: ['JavaScript', 'Vue.js', 'Node.js', 'Python', 'SQL', 'MongoDB', 'Docker', 'AWS', 'TypeScript', 'React', 'Express.js', 'Git'],
      joinDate: 'มกราคม 2024',
      profileCompletion: 92,
      stats: {
        jobsApplied: 24,
        interviews: 8,
        offers: 3,
        profileViews: 156
      }
    }
    isLoading.value = false
  }, 1000)
}

// ฟังก์ชันสำหรับเปิด/ปิดโหมดแก้ไข
const toggleEdit = () => {
  if (!isEditing.value) {
    // เข้าสู่โหมดแก้ไข - คัดลอกข้อมูลปัจจุบันไปยังฟอร์ม
    editForm.name = user.value?.name || ''
    editForm.title = user.value?.title || ''
    editForm.email = user.value?.email || ''
    editForm.phone = user.value?.phone || ''
    editForm.location = user.value?.location || ''
    editForm.experience = user.value?.experience || ''
    editForm.bio = user.value?.bio || ''
    skillsText.value = (user.value?.skills || []).join(', ')
  }
  isEditing.value = !isEditing.value
}

// ฟังก์ชันสำหรับยกเลิกการแก้ไข
const cancelEdit = () => {
  isEditing.value = false
  // รีเซ็ตฟอร์ม
  editForm.name = ''
  editForm.title = ''
  editForm.email = ''
  editForm.phone = ''
  editForm.location = ''
  editForm.experience = ''
  editForm.bio = ''
  skillsText.value = ''
}

// ฟังก์ชันสำหรับบันทึกการแก้ไขโปรไฟล์
const saveProfile = () => {
  if (!user.value) return
  
  // อัพเดทข้อมูลผู้ใช้
  user.value.name = editForm.name
  user.value.title = editForm.title
  user.value.email = editForm.email
  user.value.phone = editForm.phone
  user.value.location = editForm.location
  user.value.experience = editForm.experience
  user.value.bio = editForm.bio
  
  // แปลงทักษะจากข้อความเป็น array
  user.value.skills = skillsText.value
    .split(',')
    .map(skill => skill.trim())
    .filter(skill => skill.length > 0)
  
  // คำนวณความสมบูรณ์ของโปรไฟล์ใหม่
  const completedFields = [
    user.value.name,
    user.value.title,
    user.value.email,
    user.value.phone,
    user.value.location,
    user.value.experience,
    user.value.bio,
    user.value.skills.length > 0
  ].filter(field => field && field !== '').length
  
  user.value.profileCompletion = Math.round((completedFields / 8) * 100)
  
  isEditing.value = false
  
  // แสดงข้อความแจ้งเตือน
  alert('บันทึกข้อมูลโปรไฟล์เรียบร้อยแล้ว!')
}

// ฟังก์ชันสำหรับออกจากระบบ
const logout = () => {
  if (confirm('คุณต้องการออกจากระบบหรือไม่?')) {
    // ในการใช้งานจริง จะต้องเรียก API สำหรับออกจากระบบ
    alert('ออกจากระบบเรียบร้อยแล้ว!')
    // นำทางไปยังหน้าหลัก
    window.location.href = '/'
  }
}

// เรียกใช้ฟังก์ชันดึงข้อมูลเมื่อคอมโพเนนต์ถูกโหลด
onMounted(() => {
  fetchUserProfile()
})
</script>

<style scoped>
/* Blob Animations */
@keyframes blob {
  0% {
    transform: translate(0px, 0px) scale(1);
  }
  33% {
    transform: translate(30px, -50px) scale(1.1);
  }
  66% {
    transform: translate(-20px, 20px) scale(0.9);
  }
  100% {
    transform: translate(0px, 0px) scale(1);
  }
}

.animate-blob {
  animation: blob 7s infinite;
}

.animation-delay-2000 {
  animation-delay: 2s;
}

.animation-delay-4000 {
  animation-delay: 4s;
}

.animation-delay-6000 {
  animation-delay: 6s;
}

.animation-delay-1000 {
  animation-delay: 1s;
}

/* Glassmorphism Effects */
.backdrop-blur-md {
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
}

.backdrop-blur-sm {
  backdrop-filter: blur(4px);
  -webkit-backdrop-filter: blur(4px);
}

/* Card Hover Effects */
.card-hover {
  transition: all 0.3s ease;
}

.card-hover:hover {
  transform: translateY(-2px);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

/* Skill Tags Hover */
.skill-tag {
  transition: all 0.2s ease;
}

.skill-tag:hover {
  transform: scale(1.05);
  background: rgba(255, 255, 255, 0.3);
}
</style>
