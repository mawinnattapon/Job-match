<template>
  <div class="min-h-screen bg-gradient-to-br from-emerald-50 via-green-50 to-teal-50 relative overflow-hidden">
    <!-- Background Elements -->
    <div class="absolute inset-0">
      <!-- Grid Pattern -->
      <div class="absolute inset-0 bg-grid-emerald-100/50"></div>
      
      <!-- Floating Blobs -->
      <div class="absolute top-20 left-20 w-64 h-64 bg-emerald-200/30 rounded-full mix-blend-multiply filter blur-xl animate-blob"></div>
      <div class="absolute top-40 right-20 w-72 h-72 bg-green-200/30 rounded-full mix-blend-multiply filter blur-xl animate-blob animation-delay-2000"></div>
      <div class="absolute -bottom-8 left-40 w-80 h-80 bg-teal-200/30 rounded-full mix-blend-multiply filter blur-xl animate-blob animation-delay-4000"></div>
    </div>

    <div class="relative z-10 flex min-h-screen">
      <!-- Left Side - Marketing Content (Hidden on mobile) -->
      <div class="hidden lg:flex lg:w-1/2 flex-col justify-center px-12 xl:px-16">
        <div class="max-w-lg">
          <!-- Logo/Brand -->
          <div class="mb-8">
            <h1 class="text-4xl xl:text-5xl font-bold text-emerald-800 mb-4">
              JobMatch
              <span class="text-emerald-600">AI</span>
            </h1>
            <p class="text-lg text-emerald-700/80">
              ระบบจับคู่งานอัจฉริยะที่ช่วยคุณค้นหาโอกาสใหม่
            </p>
          </div>

          <!-- Features -->
          <div class="space-y-6 mb-12">
            <div class="flex items-center space-x-4">
              <div class="w-12 h-12 bg-emerald-100 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-semibold text-emerald-800">AI Smart Matching</h3>
                <p class="text-emerald-600 text-sm">จับคู่งานที่เหมาะกับคุณด้วย AI</p>
              </div>
            </div>

            <div class="flex items-center space-x-4">
              <div class="w-12 h-12 bg-emerald-100 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-semibold text-emerald-800">Resume Builder</h3>
                <p class="text-emerald-600 text-sm">สร้างเรซูเม่มืออาชีพได้ง่ายๆ</p>
              </div>
            </div>

            <div class="flex items-center space-x-4">
              <div class="w-12 h-12 bg-emerald-100 rounded-lg flex items-center justify-center">
                <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                </svg>
              </div>
              <div>
                <h3 class="font-semibold text-emerald-800">Real-time Updates</h3>
                <p class="text-emerald-600 text-sm">อัพเดทข้อมูลงานใหม่แบบเรียลไทม์</p>
              </div>
            </div>
          </div>

          <!-- Stats -->
          <div class="grid grid-cols-3 gap-6">
            <div class="text-center">
              <div class="text-2xl font-bold text-emerald-800">10K+</div>
              <div class="text-sm text-emerald-600">ตำแหน่งงาน</div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-emerald-800">5K+</div>
              <div class="text-sm text-emerald-600">บริษัท</div>
            </div>
            <div class="text-center">
              <div class="text-2xl font-bold text-emerald-800">95%</div>
              <div class="text-sm text-emerald-600">ความพึงพอใจ</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Side - Login Form -->
      <div class="w-full lg:w-1/2 flex items-center justify-center px-6 py-12">
        <div class="w-full max-w-md">
          <!-- Mobile Logo (Visible only on mobile) -->
          <div class="lg:hidden text-center mb-8">
            <h1 class="text-3xl font-bold text-emerald-800 mb-2">
              JobMatch <span class="text-emerald-600">AI</span>
            </h1>
            <p class="text-emerald-700">ระบบจับคู่งานอัจฉริยะ</p>
          </div>

          <!-- Login Card -->
          <div class="bg-white/80 backdrop-blur-lg rounded-2xl shadow-xl border border-emerald-100/50 p-8 relative overflow-hidden">
            <!-- AI Badge -->
            <div class="absolute top-4 right-4">
              <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-emerald-100 text-emerald-800 border border-emerald-200">
                <span class="w-2 h-2 bg-emerald-500 rounded-full mr-2 animate-pulse"></span>
                AI POWERED
              </span>
            </div>

            <!-- Header -->
            <div class="mb-8">
              <h2 class="text-2xl font-bold text-gray-900 mb-2">เข้าสู่ระบบ</h2>
              <p class="text-gray-600">ยินดีต้อนรับกลับสู่ JobMatch AI</p>
            </div>

            <!-- Login Form -->
            <form @submit.prevent="handleLogin" class="space-y-6">
              <!-- Email Field -->
              <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                  อีเมล
                </label>
                <div class="relative">
                  <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"></path>
                    </svg>
                  </div>
                  <input
                    id="email"
                    v-model="form.email"
                    type="email"
                    required
                    class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors"
                    :class="{ 'border-red-300 focus:ring-red-500 focus:border-red-500': errors.email }"
                    placeholder="example@email.com"
                  />
                </div>
                <p v-if="errors.email" class="mt-1 text-sm text-red-600">{{ errors.email }}</p>
              </div>

              <!-- Password Field -->
              <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-2">
                  รหัสผ่าน
                </label>
                <div class="relative">
                  <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                  </div>
                  <input
                    id="password"
                    v-model="form.password"
                    :type="showPassword ? 'text' : 'password'"
                    required
                    class="block w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors"
                    :class="{ 'border-red-300 focus:ring-red-500 focus:border-red-500': errors.password }"
                    placeholder="••••••••"
                  />
                  <button
                    type="button"
                    @click="showPassword = !showPassword"
                    class="absolute inset-y-0 right-0 pr-3 flex items-center"
                  >
                    <svg v-if="showPassword" class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21"></path>
                    </svg>
                    <svg v-else class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                    </svg>
                  </button>
                </div>
                <p v-if="errors.password" class="mt-1 text-sm text-red-600">{{ errors.password }}</p>
              </div>

              <!-- Remember Me & Forgot Password -->
              <div class="flex items-center justify-between">
                <div class="flex items-center">
                  <input
                    id="remember-me"
                    v-model="form.rememberMe"
                    type="checkbox"
                    class="h-4 w-4 text-emerald-600 focus:ring-emerald-500 border-gray-300 rounded"
                  />
                  <label for="remember-me" class="ml-2 block text-sm text-gray-700">
                    จดจำการเข้าสู่ระบบ
                  </label>
                </div>
                <a href="#" class="text-sm text-emerald-600 hover:text-emerald-500 transition-colors">
                  ลืมรหัสผ่าน?
                </a>
              </div>

              <!-- Login Button -->
              <button
                type="submit"
                :disabled="isLoading"
                class="w-full bg-emerald-600 hover:bg-emerald-700 text-white font-semibold py-3 px-4 rounded-lg transition-all duration-200 transform hover:scale-[1.02] focus:outline-none focus:ring-2 focus:ring-emerald-500 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
              >
                <span v-if="!isLoading" class="flex items-center justify-center">
                  เข้าสู่ระบบ
                </span>
                <span v-else class="flex items-center justify-center">
                  <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                    <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                    <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                  </svg>
                  กำลังเข้าสู่ระบบ...
                </span>
              </button>

              <!-- Divider -->
              <div class="relative my-6">
                <div class="absolute inset-0 flex items-center">
                  <div class="w-full border-t border-gray-300"></div>
                </div>
                <div class="relative flex justify-center text-sm">
                  <span class="px-2 bg-white text-gray-500">หรือ</span>
                </div>
              </div>

              <!-- Social Login -->
              <div class="space-y-3">
                <button
                  type="button"
                  class="w-full flex items-center justify-center px-4 py-3 border border-gray-300 rounded-lg shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition-colors"
                >
                  <svg class="w-5 h-5 mr-3" viewBox="0 0 24 24">
                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                  </svg>
                  เข้าสู่ระบบด้วย Google
                </button>

                <button
                  type="button"
                  class="w-full flex items-center justify-center px-4 py-3 border border-gray-300 rounded-lg shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 transition-colors"
                >
                  <svg class="w-5 h-5 mr-3" fill="#1877F2" viewBox="0 0 24 24">
                    <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                  </svg>
                  เข้าสู่ระบบด้วย Facebook
                </button>
              </div>

              <!-- Register Link -->
              <p class="text-center text-sm text-gray-600">
                ยังไม่มีบัญชี?
                <NuxtLink to="/register" class="text-emerald-600 hover:text-emerald-500 font-medium transition-colors">
                  สมัครสมาชิก
                </NuxtLink>
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'custom'
})

import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const isLoading = ref(false)
const showPassword = ref(false)

const form = reactive({
  email: '',
  password: '',
  rememberMe: false
})

const errors = reactive({
  email: '',
  password: ''
})

const validateEmail = (email: string) => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}

const handleLogin = async () => {
  // Reset errors
  errors.email = ''
  errors.password = ''
  
  // Validate form
  if (!form.email) {
    errors.email = 'กรุณากรอกอีเมล'
    return
  }
  
  if (!validateEmail(form.email)) {
    errors.email = 'รูปแบบอีเมลไม่ถูกต้อง'
    return
  }
  
  if (!form.password) {
    errors.password = 'กรุณากรอกรหัสผ่าน'
    return
  }
  
  // Show loading state
  isLoading.value = true
  
  try {
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    // Redirect to home page after successful login
    router.push('/')
  } catch (error) {
    errors.email = 'เกิดข้อผิดพลาดในการเข้าสู่ระบบ กรุณาลองอีกครั้ง'
  } finally {
    isLoading.value = false
  }
}
</script>

<style scoped>
.bg-grid-emerald-100\/50 {
  background-image: 
    linear-gradient(rgba(209, 250, 229, 0.5) 1px, transparent 1px),
    linear-gradient(90deg, rgba(209, 250, 229, 0.5) 1px, transparent 1px);
  background-size: 20px 20px;
}

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
</style>