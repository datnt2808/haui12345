// Khai báo Vuex store
import { createApp } from 'vue'
import { createStore } from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import { useToast } from 'vue-toastification'

const toast = useToast()
const store = createStore({
    state() {
        return {
            cart: {
                items: [],
                totalCartItem: 0,
            },
            favorite: {
                listFavorite: [],
            },
            search: ''
        }
    },
    // Hoạt động thưc hiện mutations 
    actions: {
        // commit tại đây thực hiện mutation
        //Example
        // addToCart({ commit }, item) {
        //     commit('ADD_ITEM', item) // Gửi action ADD_ITEM đến store để thêm sản phẩm vào giỏ hàng
        // }
    },

    mutations: {
        addToCart(state, product) {
            if(product == null){
                alert("Null")
                return;
            }
            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
            console.log(product);
            var item = state.cart.items.find((item) => item.productID === product.productID);
            if (item) {
                item.quantitys = parseInt(item.quantitys + product.quantitys);
            } else {
                state.cart.items.push(product);
                state.cart.totalCartItem++;
            }
        },

        removeCart(state, product) {
            if (product) {
                let index = state.cart.items.findIndex(x => x.productID == product.productID);
                if (index != -1) {
                    state.cart.items.splice(index, 1);
                    if (state.cart.totalCartItem > 0) {
                        state.cart.totalCartItem--;
                    }
                }
            }
        },

        addToFavorite(state, data) {
            if(data == null){
                alert("Null")
                return;
            }
            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
            console.log(data);
            var item = state.favorite.listFavorite.find((item) => item.productID === data.productID);
            if (item) {
                alert("Sản phẩm đã có trong danh sách yêu thích")
            } else {
                state.favorite.listFavorite.push(data);
                alert("Thêm vào danh sách thành công")
            }
        },

        removeFavorite(state, data) {
            if (data) {
                let index = state.favorite.listFavorite.findIndex(x => x.productID == data.productID);
                if (index != -1) {
                    state.favorite.listFavorite.splice(index, 1);
                    alert("Xóa thành công khỏi danh sách yêu thích")
                }
            }
        },

        updateSearch(state,textSearch){
            state.search = textSearch;
        }
    },
    plugins: [createPersistedState()],
});

export default store;
