<script setup lang="ts">
// ตัวแปรสำหรับเก็บข้อมูลผู้ใช้
const user = ref(null)
const isLoading = ref(true)
const isEditing = ref(false)

// ฟังก์ชันจำลองการดึงข้อมูลผู้ใช้
const fetchUserProfile = () => {
  isLoading.value = true
  
  // จำลองการดึงข้อมูลจาก API
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
      bio: 'นักพัฒนาซอฟต์แวร์ที่มีประสบการณ์ในการพัฒนาเว็บแอปพลิเคชันและมีความสนใจในเทคโนโลยีใหม่ๆ',
      skills: ['JavaScript', 'Vue.js', 'Node.js', 'Python', 'SQL', 'MongoDB', 'Docker', 'AWS'],
      joinDate: 'มกราคม 2024',
      profileCompletion: 85
    }
    isLoading.value = false
  }, 1000)
}

// ฟังก์ชันสำหรับแก้ไขโปรไฟล์
const toggleEdit = () => {
  isEditing.value = !isEditing.value
}

// ฟังก์ชันสำหรับบันทึกการแก้ไข
const saveProfile = () => {
  // ในเวอร์ชันจริงจะมีการส่งข้อมูลไปยังเซิร์ฟเวอร์
  isEditing.value = false
  alert('บันทึกข้อมูลเรียบร้อยแล้ว')
}

// เรียกใช้ฟังก์ชันเมื่อโหลดหน้า
onMounted(() => {
  fetchUserProfile()
})
</script>

<template>
  <div class="min-h-screen bg-gray-50 pb-12">
    <!-- ส่วนหัวของหน้า -->
    <div class="bg-gradient-to-r from-green-600 to-green-700 pt-8 pb-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between">
          <h1 class="text-2xl font-bold text-white">โปรไฟล์ของฉัน</h1>
          <button 
            v-if="!isLoading && !isEditing"
            @click="toggleEdit"
            class="bg-white/20 hover:bg-white/30 text-white rounded-lg px-4 py-2 transition-all duration-300 flex items-center"
          >
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
            </svg>
            แก้ไขโปรไฟล์
          </button>
        </div>
      </div>
    </div>
    
    <!-- ส่วนเนื้อหา -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 -mt-8">
      <!-- แสดงสถานะกำลังโหลด -->
      <div v-if="isLoading" class="bg-white rounded-lg shadow-md p-8 flex justify-center items-center min-h-[400px]">
        <div class="text-center">
          <svg class="animate-spin h-12 w-12 text-green-600 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
          </svg>
          <p class="mt-4 text-lg text-gray-600">กำลังโหลดข้อมูล...</p>
        </div>
      </div>
      
      <!-- แสดงข้อมูลโปรไฟล์ -->
      <div v-else class="space-y-6">
        <!-- ส่วนข้อมูลหลัก -->
        <div class="bg-white rounded-lg shadow-md overflow-hidden">
          <div class="p-6">
            <div class="flex flex-col md:flex-row md:items-start">
              <!-- รูปโปรไฟล์ -->
              <div class="flex-shrink-0 mb-4 md:mb-0 md:mr-6">
                <div class="w-24 h-24 bg-gray-100 rounded-full overflow-hidden flex items-center justify-center">
                  <img :src="user.avatar" :alt="user.name" class="w-full h-full object-cover">
                </div>
              </div>
              
              <!-- ข้อมูลหลัก -->
              <div class="flex-grow">
                <div class="flex flex-col md:flex-row md:items-center justify-between">
                  <div>
                    <h2 class="text-2xl font-bold text-gray-900">{{ user.name }}</h2>
                    <p class="text-lg text-gray-600">{{ user.title }}</p>
                    <div class="mt-1 flex items-center text-gray-500">
                      <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                      </svg>
                      {{ user.location }}
                    </div>
                  </div>
                  
                  <!-- ความสมบูรณ์ของโปรไฟล์ -->
                  <div class="mt-4 md:mt-0">
                    <div class="text-sm text-gray-600 mb-1">ความสมบูรณ์ของโปรไฟล์</div>
                    <div class="flex items-center">
                      <div class="w-32 bg-gray-200 rounded-full h-2 mr-2">
                        <div class="bg-green-600 h-2 rounded-full" :style="`width: ${user.profileCompletion}%`"></div>
                      </div>
                      <span class="text-sm font-medium text-green-600">{{ user.profileCompletion }}%</span>
                    </div>
                  </div>
                </div>
                
                <!-- ข้อมูลเพิ่มเติม -->
                <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 text-sm">
                  <div class="flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                    </svg>
                    <span>{{ user.email }}</span>
                  </div>
                  <div class="flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                    </svg>
                    <span>{{ user.phone }}</span>
                  </div>
                  <div class="flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                    <span>ประสบการณ์ {{ user.experience }}</span>
                  </div>
                  <div class="flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5z" />
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                    </svg>
                    <span>{{ user.education }}</span>
                  </div>
                  <div class="flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2 text-gray-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                    </svg>
                    <span>เข้าร่วมเมื่อ {{ user.joinDate }}</span>
                  </div>
                </div>
                
                <!-- เกี่ยวกับฉัน -->
                <div class="mt-4">
                  <h3 class="text-lg font-medium text-gray-900">เกี่ยวกับฉัน</h3>
                  <p class="mt-1 text-sm text-gray-600">{{ user.bio }}</p>
                </div>
                
                <!-- ทักษะ -->
                <div class="mt-4">
                  <h3 class="text-lg font-medium text-gray-900">ทักษะ</h3>
                  <div class="mt-2 flex flex-wrap gap-2">
                    <span 
                      v-for="(skill, index) in user.skills" 
                      :key="index"
                      class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-50 text-green-700"
                    >
                      {{ skill }}
                    </span>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- ปุ่มดำเนินการเมื่ออยู่ในโหมดแก้ไข -->
            <div v-if="isEditing" class="mt-6 flex gap-3">
              <button 
                @click="saveProfile"
                class="flex-1 sm:flex-none inline-flex justify-center items-center px-6 py-2.5 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors duration-300"
              >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                บันทึก
              </button>
              <button 
                @click="toggleEdit"
                class="flex-1 sm:flex-none inline-flex justify-center items-center px-6 py-2.5 border border-gray-300 text-base font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors duration-300"
              >
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
                ยกเลิก
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
