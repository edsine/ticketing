<template>
  <div class="py-7">
    <header class="">
      <div class="mx-auto sm:px-4 lg:px-6 px-3">
        <div class="flex items-center justify-between">
          <div>
            <logo text-class="text-pgl-blue" />
          </div>
          <div>
            <router-link
              class="
                btn
                bg-blue-500
                hover:bg-blue-700
                text-white
                shadow-sm
                rounded-lg
              "
              to="/auth/login"
            >
              {{ $t("Login") }}
            </router-link>
          </div>
        </div>
      </div>
    </header>
    <main>
      <div class="flex flex-col-reverse justify-between mx-auto pt-32 px-3 md:px-10 lg:px-12 md:flex-row">
        <div class="flex flex-col justify-center mt-10 md:mt-0 md:w-1/2">
          <h1 class="text-center text-3xl mb-10 font-black md:text-left">PGL Help Desk Support</h1>
          <h5 class="mb-2 text-center md:text-left">
            Phone: +2340000000000
          </h5>
            <h5 class="mb-10 text-center md:text-left">
            Email: info@pglnigeria.com
          </h5>
          <div class="text-center md:text-left">
            <router-link
              class="
                btn
                bg-blue-500
                hover:bg-blue-700
                text-white
                shadow-sm
                rounded-lg
              "
              to="/auth/login"
            >
              {{ $t("Get Started") }}
            </router-link>
          </div>
        </div>
        <div class="md:w-1/2">
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
