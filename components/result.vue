<template>
    <div>
        <div>result</div>
        <h4>{{result?.value?.name}}</h4>
        <img class="image" :src="'https://resources.tidal.com/images/' + result?.value.picture.replace('-','/') + '/750x750.jpg'" />
    </div>
</template>