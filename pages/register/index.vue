<script setup lang="ts">
definePageMeta({
  layout: 'custom'
})
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const firstName = ref('')
const lastName = ref('')
const email = ref('')
const password = ref('')
const confirmPassword = ref('')
const acceptTerms = ref(false)
const isLoading = ref(false)
const errorMessage = ref('')
const showPassword = ref(false)
const showConfirmPassword = ref(false)

const validateEmail = (email: string) => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

const togglePasswordVisibility = (field: 'password' | 'confirmPassword') => {
  if (field === 'password') {
    showPassword.value = !showPassword.value
  } else {
    showConfirmPassword.value = !showConfirmPassword.value
  }
}

const handleRegister = async () => {
  // Reset error message
  errorMessage.value = ''
  
  // Validate form
  if (!firstName.value) {
    errorMessage.value = 'กรุณากรอกชื่อ'
    return
  }
  
  if (!lastName.value) {
    errorMessage.value = 'กรุณากรอกนามสกุล'
    return
  }
  
  if (!email.value) {
    errorMessage.value = 'กรุณากรอกอีเมล'
    return
  }
  
  if (!validateEmail(email.value)) {
    errorMessage.value = 'รูปแบบอีเมลไม่ถูกต้อง'
    return
  }
  
  if (!password.value) {
    errorMessage.value = 'กรุณากรอกรหัสผ่าน'
    return
  }
  
  if (password.value.length < 8) {
    errorMessage.value = 'รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร'
    return
  }
  
  if (password.value !== confirmPassword.value) {
    errorMessage.value = 'รหัสผ่านไม่ตรงกัน'
    return
  }
  
  if (!acceptTerms.value) {
    errorMessage.value = 'กรุณายอมรับข้อตกลงและเงื่อนไข'
    return
  }
  
  // Show loading state
  isLoading.value = true
  
  try {
    // Here you would integrate with your actual registration API
    // For now, we'll simulate a registration with a timeout
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    // Redirect to dashboard or job matching page after successful registration
    router.push('/')
  } catch (error) {
    errorMessage.value = 'เกิดข้อผิดพลาดในการลงทะเบียน กรุณาลองอีกครั้ง'
  } finally {
    isLoading.value = false
  }
}

const goToLogin = () => {
  router.push('/login')
}
</script>

<template>
  <!-- Full Screen Container with Two Columns Layout -->
  <div class="min-h-screen flex flex-col md:flex-row">
    <!-- Left Column - Hero Image and Branding (Hidden on Mobile) -->
    <div class="hidden md:flex md:w-1/2 bg-green-600 text-white flex-col justify-center items-center p-12 relative overflow-hidden">
      <!-- Background Pattern -->
      <div class="absolute inset-0 opacity-10">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
          <defs>
            <pattern id="pattern" width="40" height="40" patternUnits="userSpaceOnUse">
              <circle cx="20" cy="20" r="3" fill="currentColor" />
            </pattern>
          </defs>
          <rect width="100%" height="100%" fill="url(#pattern)" />
        </svg>
      </div>
      
      <!-- Hero Content -->
      <div class="relative z-10 max-w-md">
        <!-- Logo -->
        <div class="flex items-center mb-12">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 mr-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
          </svg>
          <h1 class="text-2xl font-bold">JobMatch AI</h1>
        </div>
        
        <!-- Hero Title and Description -->
        <h2 class="text-4xl font-bold mb-6">ค้นหางานที่ใช่สำหรับคุณ</h2>
        <p class="text-xl mb-8">ระบบ AI ของเราจะวิเคราะห์ทักษะและประสบการณ์ของคุณ เพื่อแนะนำงานที่เหมาะสมกับคุณมากที่สุด</p>
        
        <!-- Feature List -->
        <ul class="space-y-4">
          <li class="flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span>ค้นหางานที่เหมาะกับทักษะของคุณ</span>
          </li>
          <li class="flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span>รับการแจ้งเตือนตำแหน่งงานใหม่ที่ตรงกับความต้องการ</span>
          </li>
          <li class="flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span>เชื่อมต่อกับบริษัทชั้นนำทั่วประเทศ</span>
          </li>
        </ul>
      </div>
      
      <!-- Decorative Elements -->
      <div class="absolute bottom-0 right-0 transform translate-x-1/4 translate-y-1/4">
        <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 200 200" fill="none">
          <circle cx="100" cy="100" r="80" fill="rgba(255,255,255,0.1)" />
          <circle cx="100" cy="100" r="60" fill="rgba(255,255,255,0.1)" />
          <circle cx="100" cy="100" r="40" fill="rgba(255,255,255,0.1)" />
        </svg>
      </div>
    </div>
    
    <!-- Right Column - Registration Form -->
    <div class="w-full md:w-1/2 bg-white flex flex-col justify-center p-6 md:p-12 overflow-y-auto">
      <!-- Mobile Logo (Visible only on mobile) -->
      <div class="flex md:hidden justify-center mb-8">
        <div class="flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 mr-2 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
          </svg>
          <h1 class="text-xl font-bold text-green-600">JobMatch AI</h1>
        </div>
      </div>
      
      <!-- Form Header -->
      <div class="mb-10">
        <h2 class="text-3xl font-bold text-gray-900 mb-2">สมัครสมาชิก</h2>
        <p class="text-gray-600">เริ่มต้นค้นหางานที่เหมาะกับคุณด้วยระบบ AI ที่ทันสมัย</p>
      </div>
      
      <!-- Register Form -->
      <div>
        <form @submit.prevent="handleRegister" class="space-y-6 max-w-md mx-auto">
          <!-- Name Fields (First Name and Last Name) -->
          <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
            <!-- First Name Field -->
            <div>
              <label for="firstName" class="block text-sm font-medium text-gray-700">ชื่อ</label>
              <div class="mt-1">
                <input
                  v-model="firstName"
                  type="text"
                  id="firstName"
                  name="firstName"
                  autocomplete="given-name"
                  class="block w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500 sm:text-sm"
                  :class="{'border-red-300 focus:ring-red-500 focus:border-red-500': errorMessage && !firstName}"
                />
              </div>
            </div>
            
            <!-- Last Name Field -->
            <div>
              <label for="lastName" class="block text-sm font-medium text-gray-700">นามสกุล</label>
              <div class="mt-1">
                <input
                  v-model="lastName"
                  type="text"
                  id="lastName"
                  name="lastName"
                  autocomplete="family-name"
                  class="block w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500 sm:text-sm"
                  :class="{'border-red-300 focus:ring-red-500 focus:border-red-500': errorMessage && !lastName}"
                />
              </div>
            </div>
          </div>
          
          <!-- Email Field -->
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">อีเมล</label>
            <div class="mt-1 relative rounded-md shadow-sm">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207" />
                </svg>
              </div>
              <input
                v-model="email"
                type="email"
                id="email"
                name="email"
                autocomplete="email"
                placeholder="your.email@example.com"
                class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500 sm:text-sm"
                :class="{'border-red-300 focus:ring-red-500 focus:border-red-500': errorMessage && (!email || !validateEmail(email))}"
              />
            </div>
          </div>
          
          <!-- Password Field -->
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">รหัสผ่าน</label>
            <div class="mt-1 relative rounded-md shadow-sm">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                </svg>
              </div>
              <input
                v-model="password"
                :type="showPassword ? 'text' : 'password'"
                id="password"
                name="password"
                autocomplete="new-password"
                placeholder="••••••••"
                class="block w-full pl-10 pr-10 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500 sm:text-sm"
                :class="{'border-red-300 focus:ring-red-500 focus:border-red-500': errorMessage && !password}"
              />
              <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                <button 
                  type="button" 
                  @click="togglePasswordVisibility('password')" 
                  class="text-gray-400 hover:text-gray-500 focus:outline-none"
                >
                  <svg v-if="showPassword" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                  </svg>
                  <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                </button>
              </div>
            </div>
            <p class="mt-1 text-xs text-gray-500">รหัสผ่านต้องมีอย่างน้อย 8 ตัวอักษร</p>
          </div>
          
          <!-- Confirm Password Field -->
          <div>
            <label for="confirmPassword" class="block text-sm font-medium text-gray-700">ยืนยันรหัสผ่าน</label>
            <div class="mt-1 relative rounded-md shadow-sm">
              <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                </svg>
              </div>
              <input
                v-model="confirmPassword"
                :type="showConfirmPassword ? 'text' : 'password'"
                id="confirmPassword"
                name="confirmPassword"
                autocomplete="new-password"
                placeholder="••••••••"
                class="block w-full pl-10 pr-10 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-green-500 sm:text-sm"
                :class="{'border-red-300 focus:ring-red-500 focus:border-red-500': errorMessage && password !== confirmPassword}"
              />
              <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                <button 
                  type="button" 
                  @click="togglePasswordVisibility('confirmPassword')" 
                  class="text-gray-400 hover:text-gray-500 focus:outline-none"
                >
                  <svg v-if="showConfirmPassword" xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                  </svg>
                  <svg v-else xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                </button>
              </div>
            </div>
          </div>
          
          <!-- Terms and Conditions Checkbox -->
          <div class="flex items-start">
            <div class="flex items-center h-5">
              <input
                v-model="acceptTerms"
                id="acceptTerms"
                name="acceptTerms"
                type="checkbox"
                class="h-4 w-4 text-green-600 focus:ring-green-500 border-gray-300 rounded"
                :class="{'border-red-300': errorMessage && !acceptTerms}"
              />
            </div>
            <div class="ml-3 text-sm">
              <label for="acceptTerms" class="font-medium text-gray-700">ยอมรับ<a href="#" class="text-green-600 hover:text-green-500">ข้อตกลงและเงื่อนไข</a></label>
            </div>
          </div>
          
          <!-- Error Message Display -->
          <div v-if="errorMessage" class="rounded-md bg-red-50 p-4 animate-fade-in">
            <div class="flex">
              <div class="flex-shrink-0">
                <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                  <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                </svg>
              </div>
              <div class="ml-3">
                <h3 class="text-sm font-medium text-red-800">{{ errorMessage }}</h3>
              </div>
            </div>
          </div>
          
          <!-- Register Button -->
          <div>
            <button
              type="submit"
              class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-gradient-to-r from-green-500 to-green-600 hover:from-green-600 hover:to-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transform transition hover:scale-105"
              :class="{'opacity-70 cursor-not-allowed': isLoading}"
              :disabled="isLoading"
            >
              <svg v-if="isLoading" class="animate-spin -ml-1 mr-2 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              <span>ลงทะเบียน</span>
            </button>
          </div>
          
          <!-- Login Link -->
          <div class="text-center mt-4">
            <p class="text-sm text-gray-600">
              มีบัญชีอยู่แล้ว? 
              <button 
                @click="goToLogin" 
                type="button" 
                class="font-medium text-green-600 hover:text-green-500 focus:outline-none"
              >
                เข้าสู่ระบบ
              </button>
            </p>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style scoped>
.animate-fade-in {
  animation: fadeIn 0.3s ease-in-out;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>