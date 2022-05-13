<template>
  <div class="py-7">
    <header class="">
      <div class="max-w-7xl mx-auto sm:px-4 lg:px-6 px-3">
        <div class="md:flex md:items-center md:justify-between">
          <logo text-class="text-pgl-blue" />
          <div class="mt-4 flex md:mt-0 md:ml-4">
            <router-link
              class="btn bg-pgl-green text-white shadow-sm rounded-lg"
              to="/auth/login"
            >
              {{ $t("Login") }}
            </router-link>
          </div>
        </div>
      </div>
    </header>
    <main>
      <div class="flex justify-between mx-auto pt-32 px-44">
        <div class="w-3/6 items-center mt-10">
          <h1 class="text-3xl mb-10 font-black">PGL Help Desk Support</h1>
          <h5 class="mb-10">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi
            voluptate dignissimos provident deserunt. Laborum perferendis
            ducimus iure, sit fuga magnam voluptatibus suscipit asperiores harum
            debitis! Illum labore ex reiciendis dolor?
          </h5>
          <div class="">
            <router-link
              class="btn bg-pgl-green text-white shadow-sm rounded-lg"
              to="/auth/register"
            >
              {{ $t("Get Started") }}
            </router-link>
          </div>
        </div>
        <div class="ml-10">
          <img :src="image" alt="" />
        </div>
      </div>
    </main>
  </div>
</template>


<script>
import Logo from "../../../components/layout/shared/logo";
import image from "../../../../images/landing/landing.png";

export default {
  name: "landing",
  components: { Logo },
  data: function () {
    return {
      image: image,
    };
  },
};
</script>
