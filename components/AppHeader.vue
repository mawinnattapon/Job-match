<script setup lang="ts">
import { ref } from 'vue'

// สถานะสำหรับเมนูมือถือ
const isMobileMenuOpen = ref(false)

// ฟังก์ชันเปิด/ปิดเมนูมือถือ
const toggleMobileMenu = () => {
  isMobileMenuOpen.value = !isMobileMenuOpen.value
}
</script>

<template>
  <nav class="bg-white shadow-sm">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between h-16">
        <!-- Logo and Brand -->
        <div class="flex">
          <div class="flex-shrink-0 flex items-center">
            <div class="flex items-center">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              <span class="ml-2 text-xl font-bold text-gray-900">JobMatch AI</span>
            </div>
          </div>
          <!-- Desktop Navigation Links -->
          <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
            <NuxtLink to="/" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium" active-class="border-green-500 text-gray-900">
              หน้าหลัก
            </NuxtLink>
            <NuxtLink to="/work" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium" active-class="border-green-500 text-gray-900">
              งานแนะนำ
            </NuxtLink>
            <NuxtLink to="/applications" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium" active-class="border-green-500 text-gray-900">
              ประวัติการสมัคร
            </NuxtLink>
            <NuxtLink to="/profile" class="border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium" active-class="border-green-500 text-gray-900">
              โปรไฟล์
            </NuxtLink>
          </div>
        </div>
        
        <!-- User Menu -->
        <div class="hidden sm:ml-6 sm:flex sm:items-center">
          <button type="button" class="bg-white p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
            <span class="sr-only">ดูการแจ้งเตือน</span>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
            </svg>
          </button>
          
          <!-- Profile dropdown -->
          <div class="ml-3 relative">
            <div>
              <button type="button" class="bg-white flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500" id="user-menu-button">
                <span class="sr-only">เปิดเมนูผู้ใช้</span>
                <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
              </button>
            </div>
          </div>
        </div>
        
        <!-- Mobile menu button -->
        <div class="-mr-2 flex items-center sm:hidden">
          <button 
            @click="toggleMobileMenu" 
            type="button" 
            class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-green-500"
            :aria-expanded="isMobileMenuOpen"
          >
            <span class="sr-only">เปิดเมนูหลัก</span>
            <!-- Icon when menu is closed -->
            <svg 
              v-if="!isMobileMenuOpen" 
              class="block h-6 w-6" 
              xmlns="http://www.w3.org/2000/svg" 
              fill="none" 
              viewBox="0 0 24 24" 
              stroke="currentColor" 
              aria-hidden="true"
            >
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
            <!-- Icon when menu is open -->
            <svg 
              v-else 
              class="block h-6 w-6" 
              xmlns="http://www.w3.org/2000/svg" 
              fill="none" 
              viewBox="0 0 24 24" 
              stroke="currentColor" 
              aria-hidden="true"
            >
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      </div>
    </div>

    <!-- Mobile menu, show/hide based on menu state -->
    <div v-if="isMobileMenuOpen" class="sm:hidden">
      <div class="pt-2 pb-3 space-y-1">
        <NuxtLink to="/" class="bg-white border-l-4 border-transparent text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700 block pl-3 pr-4 py-2 text-base font-medium" active-class="bg-green-50 border-green-500 text-green-700">
          หน้าหลัก
        </NuxtLink>
        <NuxtLink to="/work" class="bg-white border-l-4 border-transparent text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700 block pl-3 pr-4 py-2 text-base font-medium" active-class="bg-green-50 border-green-500 text-green-700">
          งานแนะนำ
        </NuxtLink>
        <NuxtLink to="/history" class="bg-white border-l-4 border-transparent text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700 block pl-3 pr-4 py-2 text-base font-medium" active-class="bg-green-50 border-green-500 text-green-700">
          ประวัติการสมัคร
        </NuxtLink>
        <NuxtLink to="/profile" class="bg-white border-l-4 border-transparent text-gray-500 hover:bg-gray-50 hover:border-gray-300 hover:text-gray-700 block pl-3 pr-4 py-2 text-base font-medium" active-class="bg-green-50 border-green-500 text-green-700">
          โปรไฟล์
        </NuxtLink>
      </div>
      <div class="pt-4 pb-3 border-t border-gray-200">
        <div class="flex items-center px-4">
          <div class="flex-shrink-0">
            <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
          </div>
          <div class="ml-3">
            <div class="text-base font-medium text-gray-800">ธนพล สมบูรณ์</div>
            <div class="text-sm font-medium text-gray-500">user@example.com</div>
          </div>
          <button type="button" class="ml-auto flex-shrink-0 bg-white p-1 rounded-full text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
            <span class="sr-only">ดูการแจ้งเตือน</span>
            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
            </svg>
          </button>
        </div>
        <div class="mt-3 space-y-1">
          <a href="#" class="block px-4 py-2 text-base font-medium text-gray-500 hover:text-gray-800 hover:bg-gray-100">
            โปรไฟล์ของคุณ
          </a>
          <a href="#" class="block px-4 py-2 text-base font-medium text-gray-500 hover:text-gray-800 hover:bg-gray-100">
            การตั้งค่า
          </a>
          <a href="/login" class="block px-4 py-2 text-base font-medium text-gray-500 hover:text-gray-800 hover:bg-gray-100">
            ออกจากระบบ
          </a>
        </div>
      </div>
    </div>
  </nav>
</template>