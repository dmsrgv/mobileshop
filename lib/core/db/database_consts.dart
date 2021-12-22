//Types
const primaryKeyType = 'INTEGER PRIMARY KEY';
const intType = 'INT NOT NULL';
const textType = 'TEXT NOT NULL';

//Tables
const homeTable = 'homeTable';
const homeStoreTable = 'homeStoreTable';
const bestSellerTable = 'bestSellerTable';

const detailTable = 'detailTable';
const detailImagesTable = 'detailImagesTable';
const detailColorsTable = 'detailColorsTable';
const detailCapacityTable = 'detailCapacityTable';

const cartTable = 'cartTable';
const cartBasketTable = 'cartBasketTable';

//Fields

const homeID = 'homeID';
const keyHome = 'keyHome';

const bestSellerID = 'id';
const bestSellerIsFavorites = 'is_favorites';
const bestSellerTitle = 'title';
const bestSellerPriceWithoutDiscount = 'price_without_discount';
const bestSellerDiscountPrice = 'discount_price';
const bestSellerPicture = 'picture';

const homeStoreID = 'id';
const homeStoreIsNew = 'is_new';
const homeStoreIsFavorites = 'is_favorites';
const homeStoreTitle = 'title';
const homeStoreSubTitle = 'subtitle';
const homeStorePicture = 'picture';
const homeStoreIsBuy = 'is_buy';

const detailID = 'id';
const keyDetailID = 'keyDetailID';
const detailIsFavorites = 'is_favorites';
const detailTitle = 'title';
const detailRating = 'rating';
const detailCpu = 'cpu';
const detailCamera = 'camera';
const detailSsd = 'ssd';
const detailSd = 'sd';
const detailPrice = 'price';

const detailImagesID = 'id';
const detailImagesUrl = 'url';

const detailColorID = 'id';
const detailColorValue = 'color';

const detailCapacityID = 'id';
const detailCapacityValue = 'capacity';

const cartID = 'id';
const keyCartID = 'keyCartID';
const cartTotal = 'total';
const cartDelivery = 'delivery';

const cartBasketID = 'id';
const cartBasketTitle = 'title';
const cartBasketImage = 'image';
const cartBasketPrice = 'price';
