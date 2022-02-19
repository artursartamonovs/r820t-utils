DIR=src

SRC_UTILS     += $(wildcard $(DIR)/*.c)
SRC_UTILS_PRE += $(wildcard $(DIR)/convenience/*.c)
OBJ_UTILS     += $(SRC_UTILS:.c=)
OBJ_UTILS_PRE += $(SRC_UTILS_PRE:.c=.o)
LDFLAGS_UTILS = -pthread  -lr820t -lrusb -lm -L.

$(DIR)-pre: $(OBJ_UTILS_PRE) $(OBJ_UTILS)

$(DIR)/convenience/%.o: $(DIR)/convenience/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $(BUILD_DIR)$@

$(DIR)/%:  $(DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -Wl,-rpath=. $(BUILD_DIR)$(OBJ_UTILS_PRE)  $< -o $(BUILD_DIR)$@ $(LDFLAGS_UTILS) 
